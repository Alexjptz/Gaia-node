import aiohttp
import asyncio
import random
import logging

# Настройка логирования — всё уходит в journald
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
log = logging.getLogger("gaia-bot")

url = "https://$NODE_ID.gaia.domains/v1/chat/completions"

headers = {"accept": "application/json", "Content-Type": "application/json"}


def load_from_file(file_name):
    try:
        with open(file_name, "r") as file:
            return [line.strip() for line in file.readlines()]
    except Exception as e:
        log.error(f"Не удалось загрузить {file_name}: {e}")
        return []


roles = load_from_file("roles.txt")
phrases = load_from_file("phrases.txt")


def generate_random_message():
    role = random.choice(roles)
    content = random.choice(phrases)
    return {"role": role, "content": content}


def create_message():
    user_message = generate_random_message()
    user_message["role"] = "user"
    other_message = generate_random_message()
    return [user_message, other_message]


async def chat_loop():
    async with aiohttp.ClientSession() as session:
        while True:
            messages = create_message()
            user_message = next(
                (msg["content"] for msg in messages if msg["role"] == "user"),
                "No user message found",
            )

            log.info(f"Отправлен вопрос: {user_message}")
            data = {"messages": messages}

            try:
                async with session.post(
                    url, json=data, headers=headers, timeout=60
                ) as response:
                    if response.status == 200:
                        result = await response.json()
                        assistant_response = result["choices"][0]["message"]["content"]
                        log.info(f"Получен ответ: {assistant_response}")
                    else:
                        text = await response.text()
                        log.warning(f"Ошибка: {response.status} - {text}")
            except asyncio.TimeoutError:
                log.warning("Тайм-аут ожидания. Отправляю следующий запрос...")
            except Exception as e:
                log.exception(f"Непредвиденная ошибка: {e}")

            await asyncio.sleep(1)


if __name__ == "__main__":
    log.info("Gaia бот запущен")
    asyncio.run(chat_loop())

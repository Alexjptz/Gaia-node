#!/bin/bash

tput reset
tput civis

# Put your logo here if nessesary

sleep 2

while true; do
    echo "1. Подготовка к установке GaiaNet (Preparation)"
    echo "2. Установка GaiaNet (Install)"
    echo "3. О нодe (About Node)"
    echo "4. Обновить (Start or update node)"
    echo "5. Удалить ноду (Delete node)"
    echo "6. Установить бота (Install Bot)"
    echo "7. Запустить бота (Start bot)"
    echo "8. Остановить бота (Stop bot)"
    echo "9. Удалить бота (Delete bot)"
    echo "10. Выход (Exit)"
    echo ""
    read -p "Выберите опцию (Select option): " option

    case $option in
        1)
            echo -e "\e[33mНачинаем подготовку (Starting preparation)...\e[0m"
            sleep 1
            # Update and install packages
            echo -e "\e[33mОбновляем и устанавливаем пакеты (Updating and installing packages)...\e[0m"
            if sudo apt update && sudo apt upgrade -y && sudo apt install -y curl sed git jq lz4 build-essential screen nano unzip python3-pip; then
                sleep 1
                echo -e "Обновление пакетов (Updating packages): \e[32mУспешно (Success)\e[0m"
                echo ""
            else
                echo -e "Обновление пакетов (Updating packages): \e[31mОшибка (Error)\e[0m"
                echo ""
                exit 1
            fi

            # install python lib
            echo -e "\e[33mУстанавливаем библиотеки (Installing libraries)...\e[0m"
            if pip install requests && pip install faker; then
                sleep 1
                echo -e "Установка библиотек (Libraries installation): \e[32mУспешно (Success)\e[0m"
                echo ""
            else
                echo -e "Установка библиотек (Libraries installation): \e[31mОшибка (Error)\e[0m"
                echo ""
                exit 1
            fi

            echo -e "\e[33m--- ПОДГОТОВКА ЗАВЕРШЕНА. PREPARATION COMPLETED ---\e[0m"
            echo ""
            ;;
        2)
            # install node
            echo -e "\e[33mНачинаем установку (Starting installation)...\e[0m"
            echo ""
            sleep 2

            if curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash; then
                sleep 1
                echo -e "Установка GaiaNet (Installation GaiaNet): \e[32mУспешно (Success)\e[0m"
                echo ""
            else
                echo -e "Установка GaiaNet (Installation GaiaNet): \e[31mОшибка (Error)\e[0m"
                echo ""
                exit 1
            fi

            echo -e "\e[33mИнициализируем GaiaNet (Init GaiaNet)...\e[0m"
            echo ""
            if source ~/.bashrc && gaianet init --config https://raw.githubusercontent.com/GaiaNet-AI/node-configs/main/qwen2-0.5b-instruct/config.json; then
                sleep 1
                echo -e "Инициализация GaiaNet (Init GaiaNet): \e[32mУспешно (Success)\e[0m"
                echo ""
            else
                echo -e "Инициализация GaiaNet (Init GaiaNet): \e[31mОшибка (Error)\e[0m"
                echo ""
            fi

            echo -e "\e[33mЗапускаем GaiaNet (Starting GaiaNet)...\e[0m"
            echo ""
            sleep 2
            if gaianet start; then
                sleep 1
                echo ""
                echo -e "\e[32mНОДА ЗАПУЩЕНА И РАБОТАЕТ (NODE STARTED AND RUNNING)!!!!\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[31mНЕ УДАЛОСЬ ЗАПУСТИТЬ НОДУ (FAILD TO START THE NODE)!!!!\e[0m"
                echo ""
            fi
            ;;
        3)
            # node info
            gaianet info
            ;;
        4)
            # update node
            echo -e "\e[33mОбновляем ноду (Updating node)...\e[0m"
            echo ""
            sleep 2
            if gaianet stop; then
                sleep 1
                echo ""
                echo -e "Нода остановлена (Node stopped): \e[32mУспешно (Success)\e[0m"
                echo ""
            else
                echo ""
                echo -e "Нода остановлена (Node stopped): \e[31mОшибка (Error)\e[0m"
                echo ""
            fi

            if curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash -s -- --upgrade; then
                sleep 1
                echo ""
                echo -e "Обновление GaiaNet (GaiaNet Update): \e[32mУспешно (Success)\e[0m"
                echo ""
            else
                echo ""
                echo -e "Обновление GaiaNet (GaiaNet Update): \e[31mОшибка (Error)\e[0m"
                echo ""
            fi

            if gaianet start; then
                sleep 1
                echo ""
                echo -e "\e[32mНОДА ЗАПУЩЕНА И РАБОТАЕТ (NODE STARTING AND RUNNING)!!!!\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[31mНЕ УДАЛОСЬ ЗАПУСТИТЬ НОДУ (FAILD TO START THE NODE)!!!!\e[0m"
                echo ""
            fi
            ;;
        5)
            # Delete node
            if curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/uninstall.sh' | bash; then
                echo ""
                echo -e "\e[33m--- НОДА УДАЛЕНА. NODE DELETED ---\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[31mНЕ УДАЛОСЬ УДАЛИТЬ НОДУ (FAILD TO DELETE THE NODE)!!!!\e[0m"
                echo ""
            fi
            ;;
        6)
            # bot installation
            echo -e "\e[33mНачинаем установку Бота (Starting BOT installation)...\e[0m"
            echo ""
            sleep 2
            read -p "Введите (Enter) NODE ID: " NODE_ID

            echo -e "\e[33mСкачиваем бота (Downloading Bot)...\e[0m"
            echo ""
            sleep 1
            if curl -O https://raw.githubusercontent.com/Alexjptz/Gaia-node/main/random_chat_with_faker.py && chmod +x random_chat_with_faker.py; then
                sleep 1
                echo -e "Бот скачан (BOT DOWNLOADED): \e[32mУспешно (Success)\e[0m"
                echo ""
            else
                echo -e "Бот скачан (BOT DOWNLOADED): \e[31mОшибка (Error)\e[0m"
                echo ""
            fi

            echo -e "\e[33mНастраиваем бота (Fixing Bot)...\e[0m"
            echo ""
            sleep 1
            if sed -i "s|SUBDOMAIN|https://$NODE_ID.us.gaianet.network|g" random_chat_with_faker.py; then
                sleep 1
                echo ""
                echo -e "\e[32mБОТ НАСТРОЕН И ГОТОВ (BOT FIXED AND READY)!!!!\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[31mНЕ УДАЛОСЬ НАСТРОИТЬ БОТА (FAILD TO FIX THE BOT)!!!!\e[0m"
                echo ""
            fi
            ;;
        7)
            # start bot
            if screen -dmS faker_session python3 ~/random_chat_with_faker.py; then
                sleep 1
                echo ""
                echo -e "\e[32mБОТ ЗАПУЩЕН И РАБОТАЕТ (BOT STARTED AND RUNNING)!!!!\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[31mНЕ УДАЛОСЬ ЗАПУСТИТЬ БОТА (FAILD TO START BOT)!!!!\e[0m"
                echo ""
            fi
            ;;
        8)
            # stop bot
            if screen -X -S faker_session quit; then
                sleep 1
                echo ""
                echo -e "\e[31mБОТ ОСТАНОВЛЕН (BOT STOPPED)!\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[34mСЕССИЯ БОТА НЕ НАЙДЕНА (BOT SESSION DOESN'T EXIST)!!!!\e[0m"
                echo ""
            fi
            ;;
        9)
            # delete bot
            if screen -X -S faker_session quit; then
                sleep 1
                echo ""
                echo -e "\e[32mБОТ ОСТАНОВЛЕН (BOT STOPPED)!\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[34mСЕССИЯ БОТА НЕ НАЙДЕНА (DIDN'T FIND BOT SESSION)!!!!\e[0m"
                echo ""
            fi

            if rm -rvf /root/random_chat_with_faker.py; then
                sleep 1
                echo ""
                echo -e "\e[32mБОТ УДАЛЕН (BOT DELETED)!\e[0m"
                echo ""
            else
                echo ""
                echo -e "\e[34mБОТ НЕ НАЙДЕН (DIDN'T FIND THE BOT)!!!!\e[0m"
                echo ""
            fi
            ;;
        10)
            # Stop script and exit
            echo -e "\e[31mСкрипт остановлен (Script stopped)\e[0m"
            echo ""
            exit 0
            ;;
        *)
            # incorrect options handling
            echo ""
            echo -e "\e[31mНеверная опция\e[0m. Пожалуйста, выберите из тех, что есть."
            echo ""
            echo -e "\e[31mInvalid option.\e[0m Please choose from the available options."
            echo ""
            ;;
    esac
done

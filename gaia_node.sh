#!/bin/bash

tput reset
tput civis

show_orange() {
    echo -e "\e[33m$1\e[0m"
}

show_blue() {
    echo -e "\e[34m$1\e[0m"
}

show_green() {
    echo -e "\e[32m$1\e[0m"
    echo
}

show_red() {
    echo -e "\e[31m$1\e[0m"
}

exit_script() {
    show_red "Скрипт остановлен (Script stopped)"
        echo
        exit 0
}

incorrect_option () {
    echo
    show_red "Неверная опция. Пожалуйста, выберите из тех, что есть."
    echo
    show_red "Invalid option. Please choose from the available options."
    echo
}

process_notification() {
    local message="$1"
    show_orange "$message"
    sleep 1 && echo
}

run_commands() {
    local commands="$*"

    if eval "$commands"; then
        sleep 1
        echo
        show_green "Успешно (Success)"
        echo
    else
        sleep 1
        echo
        show_red "Ошибка (Fail)"
        echo
    fi
}

generate_requests() {
    echo -e "\"Explain Einstein's theory of general relativity with mathematical proofs and real-world applications.\"" > phrases.txt
    echo -e "\"Describe quantum mechanics and its implications for modern technology.\"" >> phrases.txt
    echo -e "\"How does machine learning differ from traditional programming? Provide examples.\"" >> phrases.txt
    echo -e "\"What are the primary causes and potential solutions to climate change?\"" >> phrases.txt
    echo -e "\"How does the human brain process language and abstract thinking?\"" >> phrases.txt
    echo -e "\"Explain the Heisenberg uncertainty principle with real-world analogies.\"" >> phrases.txt
    echo -e "\"Describe the process of launching and maintaining a satellite in orbit.\"" >> phrases.txt
    echo -e "\"What are the fundamental differences between capitalism and socialism?\"" >> phrases.txt
    echo -e "\"How does CRISPR gene editing technology work, and what are its limitations?\"" >> phrases.txt
    echo -e "\"What are the main steps in compiling a high-level language into machine code?\"" >> phrases.txt
    echo -e "\"Explain the Big Bang theory and the evidence supporting it.\"" >> phrases.txt
    echo -e "\"How does a compiler differ from an interpreter in software development?\"" >> phrases.txt
    echo -e "\"Describe the architecture of a modern GPU and its use in AI applications.\"" >> phrases.txt
    echo -e "\"What are the philosophical implications of simulated reality theories?\"" >> phrases.txt
    echo -e "\"How does quantum entanglement challenge classical physics?\"" >> phrases.txt
    echo -e "\"What role does economics play in the development of public policy?\"" >> phrases.txt
    echo -e "\"Explain the core concepts of evolutionary biology with examples.\"" >> phrases.txt
    echo -e "\"How do modern encryption techniques ensure data integrity and privacy?\"" >> phrases.txt
    echo -e "\"Describe the cultural and scientific achievements of the Islamic Golden Age.\"" >> phrases.txt
    echo -e "\"What are the main components and operations of a blockchain transaction?\"" >> phrases.txt
    echo -e "\"Explain the basics of game theory and its applications in economics and politics.\"" >> phrases.txt
    echo -e "\"How did the invention of the printing press influence modern society?\"" >> phrases.txt
    echo -e "\"What are the effects of artificial intelligence on future employment trends?\"" >> phrases.txt
    echo -e "\"Describe the principles of chaos theory with practical examples.\"" >> phrases.txt
    echo -e "\"What are the benefits and drawbacks of nuclear energy in the 21st century?\"" >> phrases.txt
    echo -e "\"How do international trade agreements impact developing economies?\"" >> phrases.txt
    echo -e "\"Explain how deep reinforcement learning is applied in robotics.\"" >> phrases.txt
    echo -e "\"What are the psychological theories behind decision-making processes?\"" >> phrases.txt
    echo -e "\"What are the key challenges in building a decentralized autonomous organization (DAO)?\"" >> phrases.txt
    echo -e "\"Explain the process of photosynthesis in detail, including the chemical reactions involved.\"" >> phrases.txt
    echo -e "\"How do blockchain consensus mechanisms like Proof-of-Work and Proof-of-Stake differ?\"" >> phrases.txt
    echo -e "\"What are the primary components of a neural network, and how do they interact?\"" >> phrases.txt
    echo -e "\"Describe the history and evolution of the Internet, including key milestones.\"" >> phrases.txt
    echo -e "\"How does data encryption work, and what are the most secure algorithms available?\"" >> phrases.txt
    echo -e "\"What are the applications of Fourier transforms in signal processing and image compression?\"" >> phrases.txt
    echo -e "\"Explain the concept of entropy in thermodynamics with examples.\"" >> phrases.txt
    echo -e "\"What are the ethical implications of artificial intelligence in healthcare?\"" >> phrases.txt
    echo -e "\"How do you implement a distributed system for real-time data processing?\"" >> phrases.txt
    echo -e "\"Describe the differences between TCP and UDP protocols.\"" >> phrases.txt
    echo -e "\"What are the key differences between SQL and NoSQL databases?\"" >> phrases.txt
    echo -e "\"How does genetic engineering work, and what are its implications for society?\"" >> phrases.txt
    echo -e "\"Explain the difference between classical and quantum computing with examples.\"" >> phrases.txt
    echo -e "\"What are the challenges in creating an AI that can pass the Turing test?\"" >> phrases.txt
    echo -e "\"How does GPS technology work, and what are its limitations?\"" >> phrases.txt
    echo -e "\"What are the main challenges in developing fusion power plants?\"" >> phrases.txt
    echo -e "\"Describe the history of the Roman Empire in detail, including its rise and fall.\"" >> phrases.txt
    echo -e "\"How did the industrial revolution impact global society and economies?\"" >> phrases.txt
    echo -e "\"What are the key philosophical differences between existentialism and nihilism?\"" >> phrases.txt
    echo -e "\"Explain the causes and consequences of World War II in detail.\"" >> phrases.txt
    echo -e "\"What was the significance of the Renaissance period in European history?\"" >> phrases.txt
    echo -e "\"Describe the history of ancient Egypt, including its cultural and political achievements.\"" >> phrases.txt
    echo -e "\"What are the main ethical principles in utilitarianism and deontology?\"" >> phrases.txt
    echo -e "\"Explain the philosophy of Immanuel Kant and its influence on modern thought.\"" >> phrases.txt
    echo -e "\"How did the Cold War shape the political landscape of the 20th century?\"" >> phrases.txt
    echo -e "\"What are the origins and evolution of human rights as a concept?\"" >> phrases.txt
    echo -e "\"Write a detailed tutorial on how to create a blockchain from scratch in Python.\"" >> phrases.txt
    echo -e "\"How does garbage collection work in modern programming languages?\"" >> phrases.txt
    echo -e "\"Explain the differences between functional and object-oriented programming.\"" >> phrases.txt
    echo -e "\"What are the key principles of RESTful API design?\"" >> phrases.txt
    echo -e "\"How do you implement a graph traversal algorithm in Python?\"" >> phrases.txt
    echo -e "\"What are the best practices for securing a web application?\"" >> phrases.txt
    echo -e "\"How do neural networks use backpropagation for training?\"" >> phrases.txt
    echo -e "\"Describe the key differences between Docker and Kubernetes.\"" >> phrases.txt
    echo -e "\"What is the role of cryptography in securing blockchain networks?\"" >> phrases.txt
    echo -e "\"How do you design a scalable microservices architecture?\"" >> phrases.txt
}

make_service() {
    USERNAME=$(whoami)
    HOME_DIR=$(eval echo ~$USERNAME)

echo -e "[Unit]
Description=Gaia Bot
After=network.target

[Service]
ExecStart=/usr/bin/python3 $HOME_DIR/gaia-bot/gaia_bot.py
Restart=always
User=$USERNAME
Group=$USERNAME
WorkingDirectory=$HOME_DIR/gaia-bot

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/gaia-bot.service
}

print_logo () {
    echo
    show_orange "   _______      ___       __       ___ " && sleep 0.2
    show_orange "  /  _____|    /   \     |  |     /   \ " && sleep 0.2
    show_orange " |  |  __     /  ^  \    |  |    /  ^  \ " && sleep 0.2
    show_orange " |  | |_ |   /  /_\  \   |  |   /  /_\  \ " && sleep 0.2
    show_orange " |  |__| |  /  _____  \  |  |  /  _____  \ " && sleep 0.2
    show_orange "  \______| /__/     \__\ |__| /__/     \__\ " && sleep 0.2
    echo
    sleep 1
}

while true; do
    print_logo
    show_green "------ MAIN MENU ------ "
    echo "1. Node menu"
    echo "2. Bot menu"
    echo "3. Выход (Exit)"
    echo
    read -p "Выберите опцию (Select option): " option
    case $option in
        1)
            # NODE MENU
            while true; do
                show_green "------ NODE MENU ------ "
                echo "1. Подготовка (Preparation)"
                echo "2. Установка (Install)"
                echo "3. О нодe (About Node)"
                echo "4. Обновить (Update node)"
                echo "5. Перезапуск (Restart)"
                echo "6. Удалить (Delete)"
                echo "7. Выход (Exit)"
                echo
                read -p "Выберите опцию (Select option): " option
                case $option in
                    1)
                        # PREPARATION
                        process_notification "Начинаем подготовку (Starting preparation)..."
                        cd $HOME
                        run_commands "sudo apt update && sudo apt upgrade -y"

                        process_notification "Устанавливаем дополнительные пакеты  (Installing additional packages)..."
                        run_commands "sudo apt install -y curl sed git jq lz4 build-essential screen nano mc unzip python3-pip python3-dev python3-venv"
                        run_commands "pip3 install aiohttp"

                        run_commands "sudo fuser -k 8080/tcp"
                        sleep 3

                        show_green "--- ПОГОТОВКА ЗАЕРШЕНА. PREPARATION COMPLETED ---"
                        ;;
                    2)
                        # INSTALLATION
                        process_notification "Установка (Installation)..."
                        cd $HOME

                        curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash
                        sleep 2

                        echo "export PATH=\$PATH:$HOME/gaianet/bin" >> $HOME/.bashrc
                        sleep 5

                        source $HOME/.bashrc
                        sleep 10

                        if ! command -v gaianet &> /dev/null; then
                        show_red "--- Error ---"
                        echo "gaianet not found!"
                        echo "Please add $HOME/gaianet/bin to PATH."
                        exit 1
                        fi

                        process_notification "Init Gaianet"
                        run_commands "gaianet init --config https://raw.githubusercontent.com/GaiaNet-AI/node-configs/main/qwen2-0.5b-instruct/config.json"

                        # process_notification "Change port 8080 to 8781"
                        # sed -i 's/"llamaedge_port": "8080"/"llamaedge_port": "8781"/g' ~/gaianet/config.json

                        if gaianet start; then
                            echo
                            echo "--- НОДА ЗАПУЩЕНА И РАБОТАЕТ (NODE STARTED AND RUNNING) ---"
                        else
                            echo
                            echo "--- НЕ УДАЛОСЬ ЗАПУСТИТЬ НОДУ (FAILED TO START THE NODE) ---"
                        fi
                        ;;
                    3)
                        # NODE INFO
                        cd $HOME && gaianet info
                        ;;
                    4)
                        # UPDATE
                        process_notification "Обновляем ноду (Updating node)..."
                        cd $HOME
                        source $HOME/.bashrc

                        process_notification "Останавливаем (Stopping)..."
                        if gaianet stop; then
                            show_green "Нода остановлена. Node stopped"
                        else
                            show_blue "Нода не запущена. Node is not running"
                        fi

                        process_notification "Обновляем ноду (Updating node)..."
                        run_commands "curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash -s -- --upgrade"

                        if gaianet start; then
                            echo
                            echo "--- НОДА ЗАПУЩЕНА И РАБОТАЕТ (NODE STARTED AND RUNNING) ---"
                        else
                            echo
                            echo "--- НЕ УДАЛОСЬ ЗАПУСТИТЬ НОДУ (FAILED TO START THE NODE) ---"
                        fi
                        ;;
                    5)
                        # RESTART NODE
                        cd $HOME
                        source $HOME/.bashrc
                        run_commands "gaianet stop && sleep 5 && gaianet start"
                        echo
                            echo "--- НОДА ЗАПУЩЕНА И РАБОТАЕТ (NODE STARTED AND RUNNING) ---"
                        else
                            echo
                            echo "--- НЕ УДАЛОСЬ ЗАПУСТИТЬ НОДУ (FAILED TO START THE NODE) ---"
                        fi
                        ;;
                    6)
                        # DELETE
                        process_notification "Удаление (Deleting)..."
                        echo
                        while true; do
                            read -p "Удалить ноду? Delete node? (yes/no): " option

                            case "$option" in
                                yes|y|Y|Yes|YES)
                                    process_notification "Останавливаем (Stopping)..."
                                    source $HOME/.bashrc
                                    process_notification "Останавливаем (Stopping)..."
                                    if gaianet stop; then
                                        show_green "Нода остановлена. Node stopped"
                                    else
                                        show_blue "Нода не запущена. Node is not running"
                                    fi

                                    process_notification "Чистим (Cleaning)..."
                                    run_commands "rm -rvf $HOME/gaianet"
                                    # if cd $HOME && curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/uninstall.sh' | bash && rm -rvf .bash_profile .bash_profile.gaianet_backup .bashrc .bashrc.gaianet_backup .wasmedge
                                    show_green "--- НОДА УДАЛЕНА. NODE DELETED. ---"
                                    break
                                    ;;
                                no|n|N|No|NO)
                                    process_notification "Отмена (Cancel)"
                                    echo ""
                                    break
                                    ;;
                                *)
                                    incorrect_option
                                    ;;
                            esac
                        done
                        ;;
                    7)
                        # EXIT
                        break
                        ;;
                    *)
                        incorrect_option
                        ;;
                esac
            done
            ;;
        2)
            # BOT MENU
            while true; do
                show_blue "------ BOT MENU ------ "
                echo "1. Установить (Install)"
                echo "2. Запустить (Start)"
                echo "3. Остановить (Stop)"
                echo "4. Логи (Logs)"
                echo "5. Удалить (Delete)"
                echo "6. Выход (Exit)"
                echo
                read -p "Выберите опцию (Select option): " option
                case $option in
                    1)
                        # INSTALL BOT
                        process_notification "Устанавливаем (Installing)..."
                        process_notification "Введите (Enter): "
                        read -p "NODE_ID: " NODE_ID

                        mkdir -p $HOME/gaia-bot
                        cd $HOME/gaia-bot

                        generate_requests

                        echo -e "system\nuser\nassistant\ntool" > roles.txt

                        curl -L https://raw.githubusercontent.com/Alexjptz/Gaia-node/main/chat_bot.py -o gaia_bot.py

                        sed -i "s|\$NODE_ID|$NODE_ID|g" gaia_bot.py

                        make_service
                        echo
                        show_green "--- УСТАНОВКА ЗАВЕРШЕНА. INSTALLATION COPLETE ---"
                        ;;
                    2)
                        # START BOT
                        process_notification "Запускаем (Starting)..."
                        systemctl daemon-reload
                        sleep 1
                        systemctl enable gaia-bot.service
                        systemctl start gaia-bot.service
                        systemctl status gaia-bot.service

                        ;;
                    3)
                        # STOP BOT
                        process_notification "Останавливаем (Stopping)..."
                        run_commands "systemctl stop gaia-bot.service"
                        ;;
                    4)
                        # LOGS
                        process_notification "Логи (Logs)..."
                        journalctl -u gaia-bot -f
                        ;;
                    5)
                        # DELETE BOT
                        process_notification "Останавливаем (Stopping)..."
                        systemctl stop gaia-bot.service
                        systemctl disable gaia-bot.service
                        rm /etc/systemd/system/gaia-bot.service
                        systemctl daemon-reload
                        sleep 3

                        process_notification "Чистим (Cleaning)..."
                        rm -rvf $HOME/gaia-bot
                        echo
                        show_green "--- БОТ УДАЛЕН. BOT DELETED. ---"
                        ;;
                    6)
                        break
                        ;;
                esac
            ;;
        3)
            exit_script
            ;;
        *)
            incorrect_option
            ;;
    esac
done

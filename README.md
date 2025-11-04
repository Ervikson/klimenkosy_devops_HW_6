Task 1

Созданные ВМ, вывел лейблы в outputs:
![alt text](img/task_1/HW_6_1_Labels.png)

Скриншоты с выводом sudo nginx -t, лейблы и вывод в terraform console module.<имя_модуля>:

Marketing VM
![alt text](img/task_1/HW_6_1_marketing_nginx.png)
![alt text](img/task_1/HW_6_1_marketing_labels.png)
![alt text](img/task_1/HW_6_1_module_marketing.png)

Analytics VM
![alt text](img/task_1/HW_6_1_analytics_vm.png)
![alt text](img/task_1/HW_6_1_analytics_labels.png)
![alt text](img/task_1/HW_6_1_module_analytics.png)

Task 2

Написал модуль по пути modules/vpc для создания сети и подсети, инициализировал и запустил код. Вывод module.vpc_dev в консоле на скрине ниже:
![alt text](img/task_2/HW_6_2_module_vpc.png)

Сгенерировал документацию к модулю, файл README.md ([/home/sergey/Documents/HW_projects/HW_6/modules/vpc/README.md](modules/vpc/README.md)):
![alt text](img/task_2/HW_6_2_README.png)

Task 3

Ресурсы в стейте:
![alt text](img/task_3/HW_6_3_state.png)

Удаляем модули:
![alt text](img/task_3/HW_6_3_deleting.png)

Импортируем обратно:

Network:
![alt text](img/task_3/HW_6_3_network_import.png)

Subnet:
![alt text](img/task_3/HW_6_3_subnet_import.png)

Marketing_vm:
![alt text](img/task_3/HW_6_3_marketing_vm.png)

Analytics_vm:
![alt text](img/task_3/HW_6_3_analytics_vm.png)

Финальный стейт-лист:
![alt text](img/task_3/HW_6_3_final.png)


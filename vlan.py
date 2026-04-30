from netmiko import ConnectHandler

device = {
    "device_type": "cisco_ios",
    "host": "192.168.1.10",
    "username": "admin",
    "password": "admin"
}

connection = ConnectHandler(**device)

commands = [
    "vlan 10",
    "name DEV",
    "vlan 20",
    "name QA"
]

output = connection.send_config_set(commands)
print(output)

connection.disconnect()
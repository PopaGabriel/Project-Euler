"""
A command-line controlled coffee maker.
"""

from dataclasses import dataclass
import sys
from collections import defaultdict
from unicodedata import name


@dataclass
class Coffee:
    name: str
    resources_needed: dict


def build_req_coff_dict(water=0, coffee=0, milk=0):
    return {"water": water, "coffee": coffee, "milk": milk}


class CoffeeMaker:
    def __init__(self):
        self.coffee_types = self.build_coffee_types()
        self.resources = self.build_resources()
        self.commands = self.build_commands()

    def __str__(self):
        return f"Coffee Types: {self.coffee_types}\n\
               Resources Inside: {self.resources}\n\
               Commands Available: {self.commands}\n"

    def build_resources(self):
        return {"water": 100, "coffee": 100, "milk": 100}

    def help(self):
        print([self.commands[elem].__name__ for elem in self.commands])

    def list(self):
        print(self.coffee_types)

    def refill(self, quantities={}):
        for key in quantities.keys:
            if key in self.resources:
                self.resources[key] += quantities[key]

    def resource_status(self):
        print(self.resources)
        return

    def check_can_make(self, name):
        coffee_needs = self.coffee_types[name].resources_needed
        print(coffee_needs)
        for resource_key in coffee_needs:
            if self.resources[resource_key] < coffee_needs[resource_key]:
                return False

        return True

    def make_coffee(self):
        name = input("What coffee do you want\n")
        if name in self.coffee_types and self.check_can_make(name):
            coffee_needs = self.coffee_types[name].resources_needed
            for resource_key in coffee_needs:
                self.resources[resource_key] -= coffee_needs[resource_key]
            print("made coffee")
            return
        sys.stdout.write("Could not make\n")

    def exit(self):
        sys.exit()

    def build_commands(self):
        x = 0
        EXIT = self.exit
        LIST_COFFEES = self.list
        MAKE_COFFEE = self.make_coffee
        HELP = self.help
        REFILL = self.refill
        RESOURCE_STATUS = self.resource_status
        return {
            "exit": EXIT,
            "list": LIST_COFFEES,
            "make_coffee": MAKE_COFFEE,
            "refill": REFILL,
            "status": RESOURCE_STATUS,
            "help": HELP,
        }

    def run_command(self, command):
        if command in self.commands:
            self.commands[command]()
            return
        sys.stdout.write("Could not find command\n")

    def build_coffee_types(self):
        with open("load_recipes.txt", "r") as file:
            x = None
            coffee_list = []
            for line in file:
                if " = " in line:
                    values = line.rstrip().split(" = ")
                    x.resources_needed[values[0]] = int(values[1])
                else:
                    if x:
                        coffee_list.append(x)
                    x = Coffee(line.rstrip(), {})
            coffee_list.append(x)
            return {elem.name: elem for elem in coffee_list}


if __name__ == "__main__":
    print("I'm a simple coffee maker")
    print("Press anything to start")
    coffee_maker = CoffeeMaker()
    while True:
        val = input("Please enter a command\n")
        coffee_maker.run_command(val)

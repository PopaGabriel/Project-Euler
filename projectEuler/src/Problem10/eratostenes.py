from traceback import print_tb


def send_to_change(listuta, value):
    for i in range(value * value, len(listuta), value):
        listuta[i] = 1


if __name__ == "__main__":
    firstList = [x for x in range(0, 2000000)]
    for (index, value) in enumerate(firstList):
        if value != 0 and value != 1:
            send_to_change(firstList, value)
    print(sum(x for x in firstList if x != 0 and x != 1))

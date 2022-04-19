from collections import defaultdict

globalMap = defaultdict(int)


def calculatePaths(maxW, maxH, currW, currH):
    if (currW, currH) in globalMap:
        return globalMap[(currW, currH)]
    value = None
    if maxW == currW and maxH == currH:
        value = 1
    elif maxW == currW:
        value = calculatePaths(maxW, maxH, currW, currH + 1)
    elif maxH == currH:
        value = calculatePaths(maxW, maxH, currW + 1, currH)
    else:
        value = calculatePaths(maxW, maxH, currW + 1, currH) + calculatePaths(
            maxW, maxH, currW, currH + 1
        )
    globalMap[(currW, currH)] = value

    return value


print(calculatePaths(20, 20, 0, 0))

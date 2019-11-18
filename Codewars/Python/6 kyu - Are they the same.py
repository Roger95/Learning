# https://www.codewars.com/kata/are-they-the-same/python

def comp(array1, array2):
    if array1 is None or array2 is None:
        return False

    for a_number in array1:
        found = False
        squared_number = a_number * a_number

        for b_number in array2:
            if b_number == squared_number:
                found = True
                array2.remove(b_number)
                break

        if not found:
            return False

    return True

# This is the most common solution in Codewars, this is how I learned about Sorted() in Python (https://www.geeksforgeeks.org/sorted-function-python/):

def comp(array1, array2):
    try:
        return sorted([i ** 2 for i in array1]) == sorted(array2)
    except:
        return False

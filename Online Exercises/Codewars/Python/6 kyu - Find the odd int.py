'''
https://www.codewars.com/kata/find-the-odd-int/python
Given an array, find the int that appears an odd number of times.

There will always be only one integer that appears an odd number of times.
'''
# I found out about the array.count() function and thought about this solution:

def find_it(seq):
    for num in seq:
        if seq.count(num)%2!=0:
            return num

# Best case scenario: O(n). Worst case scenario: O(n^2)
# The thing is, if you had to return every int that appears an odd number of times (not knowing there's only one), it becomes O(n^2) permanently.

# This is what I came up with after thinking about it for a couple more minutes:
# Long story short, the next algorithm is O(n*n/2) algorithm -> O(n^2), but twice as fast (or at least I think so, time will tell).
# If you had to return every int that appears an odd number of times (not knowing there's only one), it still is O(n*n/2).

def find_it(seq):
    check_array = []
    # O(n) loop
    for num in seq:
        check = True
        # O(n/2) loop
        for res in range(len(check_array)): # "len(array)" function is O(1), so it doesn't add into O().
            if check_array[res] == num:
                check_array.pop(res) # Pop Line - Cost: len(check_array)-res
                check = False
                break # Break Line - Loop Cost: res
            # During the second loop we'll always check "len(check_array)" number of integers.
            # Why? Because say res in "range(len(10))", then we'll check 10 numbers.
            # If we find our condition at position 5, "Break Line" will stop the loop. 6 out of 10 integers.
            # BUT, "Pop Line" has to redo the array from 6 to 10 (now 5 to 9) so it gets 4 more. 6+4 = 10 out of 10.
            # range(len(check_array) will go from 0 to at most len(seq). Loop's worst case scenario is O(n/2)
        if check:
            check_array.append(num)
    return check_array[0]

# TL;DR: At their best scenario, first algorithm is so fast O(n) comparing to the second algorithm O(n*n/2).
# On average, both algorithms will be as fast. Given the exercise, if the number is on the first half of the array, the first algorithm will be faster. Otherwise, the second is.
# Worst case scenario, both will be O(n^2) but the second algorithm will be twice as fast.
# The first algorithm is much shorter and friendly.
# The second algorithm will be consistent in its duration no matter where the number its looking for is and will always be faster if you don't know you're looking for exactly 1 integer but for "odd number of times" integers.

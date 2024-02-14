# Main Function - Implementing Breadth First Search (kinda)
def path_finder(prev_maze):
    maze = prev_maze.splitlines()
    maze_length = len(maze)
    # Initialize visited nodes
    p1 = [0,0]
    p2 = [maze_length-1,maze_length-1]

    # I had to initialize a full 0 matrix instead of using a list of visited nodes because
    # it was getting timed out as visited nodes list was growing a lot (O(n*n) at its worst).
    # This way, instead, it's O(n).
    already_visited = [[0 for col in range(maze_length)] for row in range(maze_length)]
    already_visited[0][0] = 1
    # Queue to check and to find the minimum solution. A list of arrays where first is the point (array [x,y]) and second is the amount of steps done, initialized at 0.
    to_check = [p1]
    # While we have nodes to check
    while len(to_check) > 0:
        # If we have found the answer
        if to_check[0] == p2:
            # Return the amount of steps done
            return True

        # Check available moves from point to_check[0][0]
        point = to_check[0]

        moves = []
        moves.append([point[0]+1, point[1]])
        moves.append([point[0]-1, point[1]])
        moves.append([point[0], point[1]+1])
        moves.append([point[0], point[1]-1])

        # Return only the points IN the board
        for move in moves:
            if not (0<=move[0]<maze_length and 0<=move[1]<maze_length):
                pass
            # If they have been visited once, we must not check them again
            elif (already_visited[move[0]][move[1]] == 1) or (maze[move[0]][move[1]] == 'W'):
                pass
            # First time checking the point
            else:
                # Added to visited nodes
                already_visited[move[0]][move[1]] = 1
                # Added to the check "queue" and added 1 to the amount of steps
                to_check.append(move)
        # Remove first node after being checked
        to_check.pop(0)
    # Return impossibility to reach an answer (just in case they enter an invalid point out of an 8x8 board)
    return False





'''
I would also like to post here other people's code to compare their cleverness and eficiency
------------
juansgaitan, 2020cbustos:

def path_finder(maze):
    matrix = list(map(list, maze.splitlines()))
    stack, length = [[0, 0]], len(matrix)
    while len(stack):
      x, y = stack.pop()
      if matrix[x][y] == '.':
        matrix[x][y] = 'x'
        for x, y in (x, y-1), (x, y+1), (x-1, y), (x+1, y):
          if 0 <= x < length and 0 <= y < length:
            stack.append((x, y))
    return matrix[length-1][length-1] == 'x'

I like this answer a lot because I didn't know you could pop a list and get its values like that.
The other thing I liked a lot is it's using the maze itself to mark the visited nodes.
It's so eficient, so short, so clever and so easily understandable, I love it.

------------
lechevalier, Ocelotl_Fer, KunyuHe:

def path_finder(maze):
    g = maze.splitlines()
    end, bag = len(g[0]) -1 + len(g) * 1j - 1j, {0}
    grid = {x + y * 1j for y,l in enumerate(g) for x,c in enumerate(l) if '.' == c}
    while bag:
        if end in bag: return True
        grid -= bag
        bag = grid & set.union(*({z + 1j ** k for k in range(4)} for z in bag))
    return False

I will leave this here to read it in the near (far) future because it must be good but it's too hard right now for me,
I need more code review to understand it.


'''

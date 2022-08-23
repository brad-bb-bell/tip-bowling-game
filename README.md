# Credit to Joe Mastey for most of the contents of this file.

# The rules listed here operate just as a game of bowling would.
# Solve one problem at a time, in order.
# Make sure to re-run any previously solved examples.
  # Sometimes code changes that work towards the current example will break a prior one
# In general, you should solve each problem using whatever means necessary to get working code.
  # At some point you may cross a bridge where your logic is quite tangled.
  # Empower yourself to refactor towards an understandable solution, or think about new ways to approach scoring a bowling game.

# A simple game, with no particularly interesting throws. Every throw is recorded
# by the number of pins knocked down.
# Score: 63
simple = [1,5,  4,4,  8,0,  5,3,  0,0,  4,5,  2,3,  8,1,  7,1,  1,1]


# In reality, throws that don't knock down any pins are recorded using the string '-'.
# Score: 63 (still)
simple_2 = [1,5,  4,4,  8,'-',  5,3,  '-','-',  4,5,  2,3,  8,1,  7,1,  1,1]


# Adding a spare, which means you knocked down all remaining pins in your _second_ throw.
# You get credit for those pins, but also for however many pins you knock down in your
# next throw. This is probably my average score.
# Score: 78
spares = [1,5,  4,4,  8,'/',  5,3,  '-','-',  4,5,  2,3,  8,'/',  7,1,  1,1]


# Adding a strike, which means you knocked down all ten pins on your first throw!
# You get credit for those ten pins, plus however many pins you knock down on each
# of your _next two_ throws.
# Score: 97
strikes =         [1,5,  4,4,  8,'/',  5,3,  'X',  4,5,  2,3,  8,'/',  7,1,  1,1]


# Remember that those next throws might also be spares or strikes. In this case,
# we threw a strike on frame 5, and then for our next two throws we knocked down
# four and then six pins. It doesn't matter that the second throw is a spare and
# has its own extra scoring. we only get credit for the four and six.
# Score: 101
running_marks = [1,5,  4,4,  8,'/',  5,3,  'X',  4,'/',  2,3,  8,'/',  7,1,  1,1]


# After our frame 5 strike, we threw another in frame 6! That means that for
# frame 5, we get credit for our ten pins, plus credit for the ten pins from our
# _next_ frame, and then for the two pins in the _frame after that_.
# Score: 106
running_strikes = [1,5,  4,4,  8,'/',  5,3,  'X',  'X',  2,3,  8,'/',  7,1,  1,1]


# We threw yet another strike in frame 9. This would be unimaginable for me. Your
# existing code may already work for this case, but it may trip you up later.
# Score: 113
late_strike = [1,5,  4,4,  8,'/',  5,3,  'X',  'X',  2,3,  8,'/',  'X',   1, 1]


# New rule: extra frames. If you get a strike or a spare in frame 10, we need additional
# throws to figure out how much to score. In this case we got a strike, so we take two
# additional throws (5 and 4) which are added to our frame 10 score. They are _not_ added
# to the total score themselves, they exist only to score frame 10.
# Score: 123
endgame = [1,5,  4,4,  8,'/',  5,3,  'X',  'X',  2,3,  8,'/',  7,1,  'X',  5,4]


# The rare perfect game. Twelve strikes in a row. Notice that for our extra throws we
# knocked down ten pins each. So every frame, including frame 10, was worth 30 points.
# Score: 300
perfect = ['X',  'X',  'X',  'X',  'X',  'X',  'X',  'X',  'X',  'X',  'X',  'X']

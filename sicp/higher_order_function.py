def improve(update, close, guess=1):
    while not close(guess):
        guess = update(guess)
    return guess


def golden_update(guess):
    return 1/guess + 1


def square_close_to_successor(guess):
    return approx_eq(guess * guess, guess + 1)


def approx_eq(x, y, tolerance=1e-9):
    return abs(x - y) < tolerance


phi = improve(golden_update, square_close_to_successor)
# print(phi)


def sqrt(a):
    def average(x, y):
        return (x + y)/2

    def sqrt_update(x):
        return average(x, a/x)

    def sqrt_close(x):
        return approx_eq(x * x, a)
    return improve(sqrt_update, sqrt_close)

# print(sqrt(5))


def newton_s_method(f, df, value=0):
    def x_update(x):
        return x - f(x) / df(x)

    def x_close_to_value(x):
        return approx_eq(f(x), value)
    return improve(x_update, x_close_to_value)

# from math import sin, cos
# print(newton_s_method(lambda x: cos(x) - x ** 3, lambda x: -sin(x) - 3 * x ** 2))

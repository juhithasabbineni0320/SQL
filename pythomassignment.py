age = int(input("Enter your age: "))

if age < 0:
    print("Invalid age")
elif age < 5:
    print("Your ticket is Free")
elif age <= 17:
    print("Your ticket price is Rs. 100")
elif age <= 59:
    print("Your ticket price is Rs. 200")
else:
    print("Your ticket price is Rs. 120")

# 2

units = int(input("Enter units consumed: "))

if units < 0:
    print("Invalid units")

elif units <= 100:
    bill = units * 3
    print("Total bill: Rs.", bill)

elif units <= 200:
    bill = (100 * 3) + (units - 100) * 5
    print("Total bill: Rs.", bill)
else:
    bill = (100 * 3) + (100 * 5) + (units - 200) * 8
    print("Total bill: Rs.", bill)

#3
num = int(input("Enter a number: "))

for i in range(1, 11):
    print(num, "x", i, "=", num * i)
#4
total = 0
days = 0

while total < 1000:
    savings = int(input("Enter today's savings: "))

    if savings > 0:
        total = total + savings
        days = days + 1
    else:
        print("Enter a positive amount")

print("Goal reached in", days, "days!")
print("Total saved: Rs.", total)
#5
correct_pin = 4321
attempts = 0

while attempts < 3:
    pin = int(input("Enter PIN: "))

    if pin == correct_pin:
        print("Access granted")
        break
    else:
        print("Wrong PIN")
        attempts = attempts + 1

if attempts == 3:
    print("Card blocked")
#6
n = int(input("Enter N: "))

even = 0
odd = 0

for i in range(1, n + 1):
    if i % 2 == 0:
        even = even + 1
    else:
        odd = odd + 1

print("Even numbers:", even)
print("Odd numbers:", odd)

#7
secret = 27
guesses = 0

guess = int(input("Guess the number: "))
guesses = guesses + 1

while guess != secret:
    if guess > secret:
        print("Too high")
    else:
        print("Too low")

    guess = int(input("Guess the number: "))
    guesses = guesses + 1

print("Correct! You took", guesses, "guesses.")
#8
marks = int(input("Enter your marks: "))

if marks < 0 or marks > 100:
    print("Invalid marks")
elif marks >= 90:
    print("Grade: A")
elif marks >= 75:
    print("Grade: B")
elif marks >= 50:
    print("Grade: C")
elif marks >= 35:
    print("Grade: D")
else:
    print("Fail")
#10
steps = int(input("Enter number of steps: "))

for i in range(1, steps + 1):
    for j in range(i):
        print("*", end=" ")
    print()

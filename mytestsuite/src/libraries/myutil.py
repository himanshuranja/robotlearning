def get_name():
    return "rama"


class Employee:
    def __init__(self, name, age):
       self.name = name
       self.age = age

    def getName(self):
        return self.name



if __name__ == "__main__":
    e = Employee('rama', 10)
    x = e.getName()
    print(x)

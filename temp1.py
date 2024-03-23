class Person(object):
    def __init__(self, first, last):
        self.first = first
        self.last = last

    def full_name(self):
        return "%s %s" % (self.first, self.last)

    def __str__(self):
        return "Person: " + self.full_name()


class SuperHero(Person):
    def __init__(self, first, last, nick):
        super(SuperHero, self).__init__(first, last)
        self.nick = nick

    def nick_name(self):
        return "I am %s" % self.nick


p = SuperHero("Clark", "Kent", "Superman")
print(p.nick_name())  # -> I am Superman
print(p.full_name())  # -> Clark Kent
print(type(p))  # -> <class '__main__.SuperHero'>
print(type(p) is SuperHero)  # -> True
print(type(type(p)))  # -> <class 'type'>
print(type(SuperHero))  # -> <class 'type'>
print(isinstance(p, SuperHero))  # -> True
print(isinstance(p, Person))  # -> True
print(issubclass(p.__class__, Person))  # -> True

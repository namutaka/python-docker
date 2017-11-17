# coding=utf-8
import sys

print("Hello world! ハロー")

class Field(object):
    def __init__(self):
        self.name = None
        self.internal_name = None

    def __get__(self, instance, instance_type):
        if instance is None: return self
        return getattr(instance, self.internal_name, '--')

    def __set__(self, instance, value):
        setattr(instance, self.internal_name, value)

    def __set_name__(self, owner, name):
        self.name = name
        self.internal_name = '_' + name


class Customer(object):
    first_name = Field()
    last_name = Field()
    prefix = Field()
    suffix = Field()


if __name__ == '__main__':
    print('argv', sys.argv)
    print('Customer:', repr(Customer.first_name), Customer.__dict__)
    print('Field:', repr(Customer.first_name), Customer.first_name.__dict__)
    foo = Customer()
    #from IPython import embed
    #embed() # this call anywhere in your program will start IPython

    #import IPython
    #IPython.start_ipython(argv=[])
    print('Before:', repr(foo.first_name), foo.__dict__)
    foo.first_name = 'Euler'
    print('After: ', repr(foo.first_name), foo.__dict__)



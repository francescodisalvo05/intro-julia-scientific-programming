## Week 01 

#### Why Julia is Special

* Julia is `easy` to learn (like Python or Matlab)
* Julia is `fast` (like C or Fortran)
* Julia is `free` (like Python or R)

* Julia is `dynamically typed` (i.e. the type of a variable is checked during run-time)
* Julia functions have `multiple dispatch`
* Julia supports `parallel computing` and it is `concurrent`
* Julia interfaces well with `other languages`

* Julia is `interpreted` but it uses just-in-time compilation to compile tiny bits of code

#### REPL and Arithmetical Expressions

> Basic info about the syntax

#### Logical Expression

One key feature is that it is possible to leverage the and (&&) operator in order to execute a function.

```julia
condition && function(param)
```

If "condition" will be true, then function() will be executed!

#### Type System
* Julia compares values correctly, even if the types differ (2.0 == 2 -> true)
* The operator === will also check the type (2.0 === 2 -> False)

In Julia the types are defined through hierarchies and we can use "broader" types in order to generalize.

> Int64 -> Signed -> Integer -> Real

The father of all the types is `any`. However, Julia must work with concrete types. The abstract types can be used to specify the code. 

#### Functions

One of the key features is the `multiple dispatch`. In Julia any function can have many bodies, according to different data types. It is very powerful because it allows to deal with different input data types. Obviously, each method will have its on snipped of code. 

> sin(1) and sin(1.) will actually point to different methods (of the same function)

##### Single line functions
```julia
square_single_line(x) = x^2
square_single_line(3) # 9 
```

##### Multi line functions
```julia
function square_single_line(x)
    x^2
end
square_single_line(3) # 9
```

##### Function with multiple methods

> Recall that a function may have multiple methods

```julia
pow(x) = x # x^1
pow(x,y) = x^y # x^y

# pow(3) = 3
# pow(3,2) = 3^2 = 9
```

We may also "force" the input type:

```julia
pow(x::Int64) = x # x^1
pow(x::Int64,y::Int64) = x^y # x^y
```
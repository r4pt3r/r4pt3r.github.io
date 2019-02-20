---
layout: post
title: "PHP Objects Injection"
description: "PHP Object injection vulnerability exploit"
date: 2019-02-18
tags: PHP, web-sec, object-injection
comments: true
---

# Objects
Object in PHP is same as the oops concept. Object are defined by a class.

# Class
```c++
class Home
{
    private $bedrooms;

    public function __construct() {
        $this->bedrooms = 0;
    }

    public function add_bedrooms($number)
    {
        $this->$bedrooms += $number;
    }
}
```

This sample code contains one private variable named bedrooms and two functions are there, __construct() is a magic method and add_bedrooms() is made to add the bedrooms. The class name is Home here.

# Objects
We can create a new object using new keyword

```php
<?php

require("Home.php")

$flat = new Home();
$flat->add_bedrooms(0);

$villa = new Home();    
$villa->add_bedrooms(5);

?>
```
Here we made two objects which are flat and villa and we added number of bedrooms with the help of the function as we created before which is add_bedrooms.

# Serialization
Serialization is used for easy transfer of objects

* serialize() makes the class/object to string
* Unserialize() contents back to class/object

Unserialization of user controlled data is dangerous

Example of a serialized output O:4:"Bike":1:{s:5:"color";s:5:"black";}

What this represents ?

1. O:4:"Bike":1
* O - Object
* 4 - Number of letters of the class name "Bike"
* "Bike" - Class name
* 1 - Number of properties

2. {s:5:"color";s:5:"black";}
* Object's properties with it's values


# Serialized Formats
1. boolean
* b:`<value>`;
* b:1;&nbsp;&nbsp;&nbsp;&nbsp;`//True`
* b:0;&nbsp;&nbsp;&nbsp;&nbsp;`//False`

2. integer
* i:`<value>`;
* i:1; &nbsp;&nbsp;&nbsp;&nbsp;`//1`
* i:-3; &nbsp;&nbsp;&nbsp;`//-3`

3. double
* d:`<value>`;
* d:1.1234500001; &nbsp;&nbsp;&nbsp;&nbsp;`//1.12345`

4. NULL
* N; &nbsp;&nbsp;&nbsp;&nbsp;`//NULL`

5. string
* s:`<length>`:"`<value>`";
* s:6:"r4pt3r"; &nbsp;&nbsp;&nbsp;&nbsp;`//"r4pt3r"`

6. array
* a:`<lenght>`:{key, value pairs};
* a:2::{s:4:"key1";s:6:"value1";
s:4:"key2";s:6:"value2";}&nbsp;&nbsp;&nbsp;&nbsp;
`//array("key1" => "value1",
"key2" => "value2");`

# Serialized output

```php  
<?php

class Home
{
    private $bedrooms;

    public function __construct() {
        $this->bedrooms = 0;
    }

    public function add_bedrooms($number)
    {
        $this->$bedrooms += $number;
    }
}

echo serialize(new Home);

?>
```
The output will be O:4:"Home":1:{s:14:"Homebedrooms";i:0;}

# Magic Methods
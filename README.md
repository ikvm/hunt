## Hunt framework
[Hunt](http://www.huntframework.com/) is a high-level [D Programming Language](http://dlang.org/) Web framework that encourages rapid development and clean, pragmatic design. It lets you build high-performance Web applications quickly and easily.

## Documents
You can read [wiki](https://github.com/huntlabs/hunt/wiki).

## Create project
```bash
git clone https://github.com/huntlabs/hunt-skeleton.git myproject
cd myproject
dub run -v
```

Open the URL with the browser:
```bash
http://localhost:8080/
```

## Router config
config/routes
```conf
#
# [GET,POST,PUT...]    path    controller.action
#

GET     /               index.index
GET     /users          user.list
POST    /user/login     user.login
*       /public         staticDir:public

```

## Component based
1. Routing
2. Caching
3. Middleware
4. Configretion
5. Validation
6. ORM
7. Template

## Community
QQ Group: 184183224 

[Facebook](https://www.facebook.com/huntframework/)

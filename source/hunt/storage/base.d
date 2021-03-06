module hunt.storage.base;

import std.conv : to;

interface StorageInterface
{
    //private int _expire;
    bool set(string key, ubyte[] value, int expire );
    bool set(string key, ubyte[] value);
    bool set(string key,string value,int expire);
    bool set(string key,string value);

    string get(string key);

    //T get(T)(string key);

    bool isset(string key);

    bool erase(string key);

    bool flush();

    void setExpire(int expire);

    void setDefaultHost(string host, ushort port);
}

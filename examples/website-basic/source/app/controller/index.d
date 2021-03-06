/*
 * Hunt - a framework for web and console application based on Collie using Dlang development
 *
 * Copyright (C) 2015-2016  Shanghai Putao Technology Co., Ltd 
 *
 * Developer: putao's Dlang team
 *
 * Licensed under the BSD License.
 *
 */
module app.controller.index;
import hunt.application;
import std.experimental.logger;
import std.stdio;

version(USE_ENTITY) import app.model.index;

class IpFilterMiddleware : IMiddleware{

	override string name() {
		return IpFilterMiddleware.stringof;
	}
	override Response onProcess(Request req,Response res) {
		writeln(req.getSession());
		return null;
	}
}

class IndexController : Controller
{
	mixin MakeController;
	this()
	{
		this.addMiddleware(new IpFilterMiddleware());
	}
	@Action
		void show()
		{	
			auto response = this.request.createResponse();
			response.html("hello world<br/>")
				//.setHeader("content-type","text/html;charset=UTF-8")
				.setCookie("name", "value", 10000)
				.setCookie("name1", "value", 10000, "/path")
				.setCookie("name2", "value", 10000);

			response.done();
		}
	@Action
		void list()
		{
			this.view.setLayout!"main.dhtml"();	
			this.view.test = "viile";
			this.view.username = "viile";
			this.view.header = "donglei header";
			this.view.footer = "footer";
			this.render!"content.dhtml"();

		}
	@Action
		void index()
		{
			this.response.html("list");
		}

	@Action
		void showbool()
		{
			trace("---show bool----");
			this.response.html("list");
		}
	@Action void setCache()
	{
		session.set("test","test");
		//auto key = request.get("key");	
		//auto value = request.get("value");	
		//cache.set(key,value);
		auto response = this.request.createResponse();
		//response.html("key : " ~ key ~ " value : " ~ value);
		response.html(session.sessionId);
	}
	@Action void getCache()
	{
		//auto key = request.get("key");	
		//auto value = cache.get(key);
		auto response = this.request.createResponse();
		//response.html(session.get("test") ~ " key : " ~ key ~ " value : " ~ value);
		response.html(session.get("test"));
	}
}

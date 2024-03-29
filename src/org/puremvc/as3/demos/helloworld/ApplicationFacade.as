package org.puremvc.as3.demos.helloworld 
{
	/*
	PureMVC AS3 / Flash Demo - HelloFlash
	By Cliff Hall <clifford.hall@puremvc.org>
	Copyright(c) 2007-08, Some rights reserved.
	*/
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.demos.helloworld.controller.StartupCommand;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		// Notification name constants
		public static const STARTUP:String  		= "startup";
		public static const STAGE_ADD_SPRITE:String	= "stageAddSprite";
		public static const SPRITE_SCALE:String 	= "spriteScale";
		public static const SPRITE_DROP:String		= "spriteDrop"
		
		/**
		 * Singleton ApplicationFacade Factory Method
		 */
		public static function getInstance() : ApplicationFacade {
			if ( instance == null ) instance = new ApplicationFacade( );
			return instance as ApplicationFacade;
		}
		
		/**
		 * Register Commands with the Controller 
		 */
		override protected function initializeController( ) : void 
		{
			super.initializeController();            
			registerCommand( STARTUP, StartupCommand );
		}
		
		public function startup( stage:Object ):void
		{
			sendNotification( STARTUP, stage );
		}
		
	}
}
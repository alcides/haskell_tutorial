// scalac 26_scala.scala && scala Main -h

object Main {
	
	def displayHelp:String = "Help!"
	def displayVersion:String = "0.0.0.1 alpha"
	
	def parseArgument(arg: String):String = arg match {
	    case "-h" | "--help" => displayHelp
	    case "-v" | "--version" => displayVersion
	    case _ => "RTFM"
	  }
	
	
	def main(args:Array[String]):Unit = {
		val printAndParse = { x:String => println(parseArgument(x)) }
		args foreach printAndParse;
	}
}

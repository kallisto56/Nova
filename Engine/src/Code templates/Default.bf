namespace Engine.CodeTemplates
{
	using System;


	public class NewClassGenerator : Compiler.Generator
	{
	    public override String Name => "Engine > Default";


	    public override void InitUI()
	    {
	        AddEdit("name", "Class Name", "");
	    }


	    public override void Generate(String outFileName, String outText, ref Flags generateFlags)
	    {
	        var className = mParams["name"];
	        if (className.EndsWith(".bf", .OrdinalIgnoreCase))
			{
				className.RemoveFromEnd(3);
			}

			outFileName.Append(className);

			outText.AppendF(
				$"""
				namespace Engine
				{{
					using System;
					using System.IO;
					using System.Collections;
					using System.Threading;


				    public class {className}
				    {{
						
				    }}


				}}
				""");
	    }


	}


}
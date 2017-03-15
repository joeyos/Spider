package base;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.python.core.Py;
import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.core.PySystemState;
import org.python.util.PythonInterpreter;

public class JavaInterPython
{
	public static void main(String[] args)
	{
		try{
			System.out.println("start");

			String id = "1501120463";
			String password = "123456";
			String[] args2 = {id,password};
			PythonInterpreter.initialize(null, null, args2);
			PythonInterpreter interpreter = new PythonInterpreter();
			
			PySystemState sys = Py.getSystemState();
			System.out.println(sys.path.toString());
			
			interpreter.execfile("C:\\Users\\Nicolo\\Desktop\\j2p\\studentdb.py");
			System.out.println("----------run over!----------");
			System.out.println("end");
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}

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

			// 将参数传递给Python并执行爬取学生信息的py文件
			//Process pr = Runtime.getRuntime().exec("python C:\\Users\\IVAN\\Desktop\\holi\\j2p\\studentdb.py 1601120338 113411");//可行代码
			//Process pr = Runtime.getRuntime().exec(name);
			//Process pr = Runtime.getRuntime().exec(name);
			//			PythonInterpreter interpreter = new PythonInterpreter();
			//			interpreter.execfile("D:\\j2p\\studentdb.py");
			//			PyFunction func = (PyFunction)interpreter.get("adder",PyFunction.class);
			//
			//			int a = 2010, b = 2 ;
			//			PyObject pyobj = func.__call__(new PyInteger(a), new PyInteger(b));
			//			System.out.println("anwser = " + pyobj.toString());
			//Process pr = Runtime.getRuntime().exec("python D:\\j2p\\studentdb.py ");

			//定义参数
			String[] args2 = {id,password};
			//设置参数
			PythonInterpreter.initialize(null, null, args2);
			PythonInterpreter interpreter = new PythonInterpreter();
			
			PySystemState sys = Py.getSystemState();
			System.out.println(sys.path.toString());
			
			//执行
			interpreter.execfile("C:\\Users\\IVAN\\Desktop\\holi\\j2p\\studentdb.py");
			System.out.println("----------run over!----------");


			//			BufferedReader in = new BufferedReader(new
			//					InputStreamReader(pr.getInputStream()));
			//			String line;
			//			while ((line = in.readLine()) != null)
			//			{
			//				System.out.println(line);
			//			}
			//			in.close();
			//			pr.waitFor();
			System.out.println("end");
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class JavaInterPython {
        public static void main(String[] args){
                try{
                        // System.out.println("start");

                        int id =1601120338;
                        int password= 113411;

                        // 将参数传递给Python并执行爬取学生信息的py文件
                        Process pr = Runtime.getRuntime().exec("python D:\\studentdb.py id password");

                        BufferedReader in = new BufferedReader(new
                                InputStreamReader(pr.getInputStream()));
                        // String line;
                        // while ((line = in.readLine()) != null) {
                        //     System.out.println(line);
                        // }
                        in.close();
                        pr.waitFor();
                        // System.out.println("end");
                } catch (Exception e){
                            e.printStackTrace();
                        }
                }
}

import java.util.*;

public class DivideByZeroOk {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x,y;
		Scanner sc = new Scanner(System.in);
		System.err.print("피젯수: ");
		x = sc.nextInt();
		System.out.print("젯수: ");
		y = sc.nextInt();
		
		try {
			int result = x/ y;
		} catch (ArithmeticException e){
			System.out.println("0으로 나눌 수 없습니다.");
			System.exit(0);
		}
		System.out.println("프로그램은 계속 진행됩니다.");
	}

}

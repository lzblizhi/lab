package lab;

public class Test {

	public static void main(String[] args) {
		String s = "abc";
		char[] c = { 'a', 'b', 'c' };
		method(s, c);
		System.out.println(s);
		System.out.println(c);
		}

		private static void method(String s, char[] c) {
		s = "pbc";
		c[0] = 'p';
		}
}

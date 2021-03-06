import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class FileChooserTest extends JFrame implements ActionListener {
	JButton openButton, saveButton;
	JFileChooser fc;
	JLabel l1;

	public FileChooserTest() {
		setTitle("파일 선택기 테스트");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(300, 200);

		fc = new JFileChooser();

		JLabel label = new JLabel("파일 선택기 컴포넌트 테스트입니다.");
		l1 = new JLabel("");
		openButton = new JButton("파일 오픈");
		openButton.addActionListener(this);

		saveButton = new JButton("파일 저장");
		saveButton.addActionListener(this);

		JPanel panel = new JPanel();
		JPanel p2 = new JPanel();
		panel.add(label);
		panel.add(openButton);
		panel.add(saveButton);
		p2.add(l1);
		add(panel, BorderLayout.NORTH);
		add(p2, BorderLayout.CENTER);
		setVisible(true);
	}

	public void actionPerformed(ActionEvent e) {

		// “파일 오픈”버튼에 대한 액션 이벤트 처리
		if (e.getSource() == openButton) {
			int returnVal = fc.showOpenDialog(this);

			if (returnVal == JFileChooser.APPROVE_OPTION) {
				// 실제 파일을 오픈한다.
				File file = fc.getSelectedFile();
				System.out.println(file.getPath());
				ImageIcon icon = new ImageIcon(file.getPath());
				l1.setIcon(icon);
				
			} else {
				// 사용자 취소
			}

			// “파일 저장”버튼에 대한 액션 이벤트 처리
		} else if (e.getSource() == saveButton) {
			int returnVal = fc.showSaveDialog(this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				// 실제 파일에 저장한다.
			} else {
				// 사용자 취소
			}
		}
	}

	public static void main(String[] args) {
		FileChooserTest frame = new FileChooserTest();
	}
}

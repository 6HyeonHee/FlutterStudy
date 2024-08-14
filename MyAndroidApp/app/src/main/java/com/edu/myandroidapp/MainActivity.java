package com.edu.myandroidapp;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    public static final String TAG = "lecture";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        // 로그 버튼
        Button button1 = findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.d(TAG, "Tjoeun Log print..!!");
                Toast.makeText(getApplicationContext(), "긴 토스트 메세지",
                        Toast.LENGTH_LONG).show();
            }
        });

        // 웹 브라우저 버튼
        Button button2 = findViewById(R.id.button2);
        button2.setOnClickListener(v->{
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://m.naver.com"));
            startActivity(intent);
        });

    }
    // 전화 걸기 버튼
    public void onButton3Clicked(View v){
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("tel:01083364903"));
        startActivity(intent);
    }

    // 값 읽어 오기 버튼
    public void onButton4Clicked(View v){
        EditText editText = findViewById(R.id.editText);
        TextView textView = findViewById(R.id.textView);
        textView.setText(editText.getText());

        String str = editText.getText().toString();
        Toast.makeText(getApplicationContext(), "EditText : " + str, Toast.LENGTH_SHORT).show();
    }

}
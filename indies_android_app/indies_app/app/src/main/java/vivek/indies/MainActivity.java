package vivek.indies;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.io.File;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void goToRegistration(View v)
    {
        Toast.makeText(this,"go to registration page",Toast.LENGTH_LONG).show();
        Intent i=new Intent(getApplicationContext(),Registration.class);
        startActivity(i);

    }
}

package vivek.indies;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Created by vivek2 on 28-03-2017.
 */

public class textwatcher extends AppCompatActivity implements TextWatcher {

    //private EditText ET;
    /*public void associateET(EditText editText)
    {
        ET=editText;
    }*/

    @Override
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }
    @Override
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }
    @Override
    public void afterTextChanged(Editable s) {
        Toast.makeText(getApplicationContext(),"you typed",Toast.LENGTH_LONG).show();
    }
}

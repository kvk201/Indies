package vivek.indies;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

/**
 * Created by vivek2 on 22-03-2017.
 */

public class Registration_fragment2 extends Fragment implements View.OnFocusChangeListener, TextWatcher{

    View f2_view;
    EditText pincode,city,area,dob;
    int before_length;

    String date_regular_expression = "^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(\\/|-|\\.)(?:0?[1,3-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\" +
            "d)?\\d{2})$|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^" +
            "(?:0?[1-9]|1\\d|2[0-8])(\\/|-|\\.)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        f2_view = inflater.inflate(R.layout.registration_fragment2_layout,container,false);
        return f2_view;
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        pincode=(EditText)f2_view.findViewById(R.id.f2_pincode);
        city=(EditText)f2_view.findViewById(R.id.f2_city);
        area=(EditText)f2_view.findViewById(R.id.f2_area);
        dob=(EditText)f2_view.findViewById(R.id.f2_dob);

        dob.addTextChangedListener(this);
        dob.setOnFocusChangeListener(this);
    }

    @Override
    public void onFocusChange(View v, boolean hasFocus) {
        if (v.getId()==dob.getId()&&hasFocus==false){
                    if (dob.getText().toString().matches(date_regular_expression)==false) {
                                dob.setError("invalid date of birth");
                    }
        }
    }


    @Override
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        before_length=s.length();
    }
    @Override
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }

    @Override
    public void afterTextChanged(Editable s) {
        if (s.hashCode()==dob.getText().hashCode()&&s.length()==2&&before_length==1)
        {dob.append("/");
            Toast.makeText(getActivity(), "2", Toast.LENGTH_SHORT).show();}
        if (s.hashCode()==dob.getText().hashCode()&&s.length()==5&&before_length==4)
        {dob.append("/");
            Toast.makeText(getActivity(), "5", Toast.LENGTH_SHORT).show();}
    }
}

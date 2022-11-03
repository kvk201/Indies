package vivek.indies;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Patterns;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Created by vivek2 on 22-03-2017.
 */

public class Registration_fragment1 extends Fragment implements TextWatcher, View.OnFocusChangeListener {

    View f1_view;
    EditText name, email, pass1, pass2, phone;

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        name = (EditText) f1_view.findViewById(R.id.f1_name);
        email = (EditText) f1_view.findViewById(R.id.f1_email);
        pass1 = (EditText) f1_view.findViewById(R.id.f1_password);
        pass2 = (EditText) f1_view.findViewById(R.id.f1_password2);
        phone = (EditText) f1_view.findViewById(R.id.f1_phone);

        name.addTextChangedListener(this);
        email.addTextChangedListener(this);
        pass1.addTextChangedListener(this);
        pass2.addTextChangedListener(this);
        phone.addTextChangedListener(this);

        name.setOnFocusChangeListener(this);
        email.setOnFocusChangeListener(this);
        pass1.setOnFocusChangeListener(this);
        pass2.setOnFocusChangeListener(this);
        phone.setOnFocusChangeListener(this);


    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        f1_view = inflater.inflate(R.layout.registration_fragment1_layout, container, false);
        return f1_view;
    }


    @Override
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override
    public void onTextChanged(CharSequence s, int start, int before, int count) {
        if (s.hashCode() == name.getText().hashCode()) {
            Toast.makeText(getActivity(), "type name man", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void afterTextChanged(Editable s) {
        if (s.toString().equals("vivek")) {
            Toast.makeText(getActivity(), "vivek rocks", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void onFocusChange(View v, boolean hasFocus)
            {
                    if (v.getId()==pass1.getId()&&hasFocus==false) {
                                if (pass1.length()<6){
                                    pass1.setError("minimum 6 characters required");
                                }
                                    }
                    if (v.getId()==pass2.getId()&&hasFocus==false) {
                                if (  pass1.getText().toString().equals(pass2.getText().toString())==false ){
                                        pass1.setError("passwords don't match");
                                        pass2.setError("passwords don't match");
                                            }
                                    }
                     if (v.getId()==email.getId()&&hasFocus==false&&Patterns.EMAIL_ADDRESS.matcher(email.getText().toString()).matches()==false){
                                    email.setError("invalid email ID");
                                }
            }
}

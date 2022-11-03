package vivek.indies;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.design.widget.TabLayout;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;

public class Registration extends AppCompatActivity {

    private File imagefile;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);

        //viewpager (loading fragments with adapter)
        ViewPager viewPager=(ViewPager)findViewById(R.id.R_viewpager_container);
        FragmentManager fragmentManager=getSupportFragmentManager();
        SwipeAdapter swipeAdapter=new SwipeAdapter(fragmentManager);
        viewPager.setAdapter(swipeAdapter);

        TabLayout tabLayout=(TabLayout)findViewById(R.id.tabDots);
        //attach viewpager to the dots(Tab Layout)
        tabLayout.setupWithViewPager(viewPager);
    }

   public void opencamera(View v)
    {
        imagefile =new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),"temp1.jpg");
        Uri tempuri=Uri.fromFile(imagefile);

        Intent i=new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        i.putExtra(MediaStore.EXTRA_VIDEO_QUALITY,0);
        i.putExtra(MediaStore.EXTRA_OUTPUT,tempuri);
        startActivityForResult(i,123);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 123)
        {   //Toast.makeText(this, "request code: "+requestCode, Toast.LENGTH_LONG).show();
            switch (resultCode){
                case Activity.RESULT_OK:{
                    if (imagefile.exists())
                    {   Toast.makeText(this, "saved image"+imagefile.getAbsolutePath(), Toast.LENGTH_LONG).show();
                        /*want to access stored image here and change button image src

                        Bitmap photo = (Bitmap) data.getExtras().get("data");
                        ImageButton imageButton=(ImageButton)findViewById(R.id.imageButton);
                        Bitmap scaled=Bitmap.createScaledBitmap(photo,240,240,true);
                        imageButton.setImageBitmap(scaled);*/
                    }
                    else
                        Toast.makeText(this,"image not saved",Toast.LENGTH_LONG).show();
                    break;}
                case Activity.RESULT_CANCELED:
                {Toast.makeText(this,"cancelled",Toast.LENGTH_LONG).show();}
                break;
            }
        }
    }


}

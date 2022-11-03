package vivek.indies;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

/**
 * Created by vivek2 on 22-03-2017.
 */

public class SwipeAdapter extends FragmentPagerAdapter {
    public SwipeAdapter(FragmentManager fm) {
        super(fm);
    }

    @Override
    public Fragment getItem(int x) {
        Fragment r_frag=null;
        if (x==0)
        {
            r_frag=new Registration_fragment1();
        }
        if (x==1)
        {
            r_frag=new Registration_fragment2();
        }
        if (x==2)
        {
            r_frag=new Registration_fragment3();
        }
        if (x==3)
        {
            r_frag=new Registration_fragment4();
        }
        if (x==4)
        {
            r_frag=new Registration_fragment5();
        }
        if (x==5)
        {
            r_frag=new Registration_fragment6();
        }


        return r_frag;
    }

    @Override
    public int getCount() {
        return 6;
    }

}

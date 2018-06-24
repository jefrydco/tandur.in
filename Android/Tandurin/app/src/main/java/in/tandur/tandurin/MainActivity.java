package in.tandur.tandurin;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.LinearLayout;

import in.tandur.tandurin.encyclopedia.EncyclopediaActivity;
import in.tandur.tandurin.reminder.ReminderActivity;
import in.tandur.tandurin.store.StoreActivity;

public class MainActivity extends AppCompatActivity {

    private LinearLayout mLinearLayoutReminder,
            mLinearLayoutFlowerShop, mLinearLayoutRegisterShop, mLinearLayoutEncyclopedia;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mLinearLayoutReminder = findViewById(R.id.activity_main_linearLayout_reminder);
        mLinearLayoutRegisterShop = findViewById(R.id.activity_main_linearLayout_register_shop);
        mLinearLayoutFlowerShop = findViewById(R.id.activity_main_linearLayout_flower_shop);
        mLinearLayoutEncyclopedia = findViewById(R.id.activity_main_linearLayout_encyclopedia);

        setLinearLayoutClickListener(mLinearLayoutReminder, ReminderActivity.class);
        setLinearLayoutClickListener(mLinearLayoutEncyclopedia, EncyclopediaActivity.class);
        setLinearLayoutClickListener(mLinearLayoutFlowerShop, StoreActivity.class);
    }

    void setLinearLayoutClickListener(LinearLayout target, Class cls) {
        target.setOnClickListener(v -> {
            Intent intent = new Intent(MainActivity.this, cls);
            startActivity(intent);
        });
    }
}

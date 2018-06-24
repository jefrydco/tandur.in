package in.tandur.tandurin.reminder;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import cn.iwgang.countdownview.CountdownView;
import in.tandur.tandurin.R;

public class ReminderActivity extends AppCompatActivity {

    private CountdownView mCountDownViewTimer;
    private Spinner mSpinnerTimerOption;
    private ArrayAdapter<String> mSpinnerTimerOptionAdapter;
    private List<String> mListTimerOption;
    private Button mButtonStartTimer, mButtonStopTimer;
    private long timerLength;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reminder);

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setHomeButtonEnabled(true);
        }

        timerLength = 0L;

        setupTimerOption();
        setupView();
        setupListener();
    }

    private void setupTimerOption() {
        mListTimerOption = new ArrayList<>();
        mListTimerOption.add("5");
        mListTimerOption.add("4");
        mListTimerOption.add("3");
        mListTimerOption.add("2");
        mListTimerOption.add("1");
    }

    private void setupView() {
        mCountDownViewTimer = findViewById(R.id.activity_reminder_countDownView_timer);
        mSpinnerTimerOption = findViewById(R.id.activity_main_spinner_timer_option);
        mButtonStartTimer = findViewById(R.id.activity_main_button_start_timer);
        mButtonStopTimer = findViewById(R.id.activity_main_button_stop_timer);

        mSpinnerTimerOptionAdapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, mListTimerOption);
        mSpinnerTimerOption.setAdapter(mSpinnerTimerOptionAdapter);
    }

    private void setupListener() {
        mCountDownViewTimer.setOnCountdownEndListener(cv -> {
//            Toast.makeText(this, "Time is up", Toast.LENGTH_SHORT).show();
            Intent intentToReminderInfoActivity = new Intent(ReminderActivity.this, ReminderInfoActivity.class);
            startActivity(intentToReminderInfoActivity);
        });
        mSpinnerTimerOption.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String item = parent.getItemAtPosition(position).toString();
                Long second = Long.valueOf(item);
                timerLength = secondToMillis(second);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
        mButtonStartTimer.setOnClickListener(v -> {
            mCountDownViewTimer.start(timerLength);
        });
        mButtonStopTimer.setOnClickListener(v -> {
            mCountDownViewTimer.stop();
        });
    }

    private long secondToMillis(long second) {
        return second * 1000;
    }

    private long minuteToMillis(long minute) {
        return minute * 60000L;
    }

    private long hourToMillis(long hour) {
        return hour * 3600000L;
    }
}

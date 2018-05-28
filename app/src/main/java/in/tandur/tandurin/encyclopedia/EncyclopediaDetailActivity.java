package in.tandur.tandurin.encyclopedia;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;

import in.tandur.tandurin.R;
import in.tandur.tandurin.databinding.ActivityEncyclopediaDetailBinding;
import in.tandur.tandurin.utils.GlideApp;

import static com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions.withCrossFade;

public class EncyclopediaDetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActivityEncyclopediaDetailBinding mEncyclopediaDetailBinding = DataBindingUtil.setContentView(this, R.layout.activity_encyclopedia_detail);

        Intent intentFromEncyclopediaActivity = getIntent();

        int id = intentFromEncyclopediaActivity.getIntExtra(EncyclopediaConstant.ID, 0);
        int rank = intentFromEncyclopediaActivity.getIntExtra(EncyclopediaConstant.RANK, 1);
        String imageUrl = intentFromEncyclopediaActivity.getStringExtra(EncyclopediaConstant.IMAGE_URL);
        String regularName = intentFromEncyclopediaActivity.getStringExtra(EncyclopediaConstant.REGULAR_NAME);
        String scientificName = intentFromEncyclopediaActivity.getStringExtra(EncyclopediaConstant.SCIENTIFIC_NAME);
        String description = intentFromEncyclopediaActivity.getStringExtra(EncyclopediaConstant.DESCRIPTION);

        EncyclopediaModel mEncyclopediaModel = new EncyclopediaModel(id, rank, imageUrl, regularName, scientificName, description);

        setSupportActionBar(mEncyclopediaDetailBinding.activityEncyclopediaDetailToolbar);

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayShowHomeEnabled(true);
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setTitle(regularName);
        }

        GlideApp.with(mEncyclopediaDetailBinding.activityEncyclopediaDetailImageView)
                .load(imageUrl)
                .transition(withCrossFade())
                .centerCrop()
                .placeholder(R.drawable.ic_local_florist_pink_64dp)
                .into(mEncyclopediaDetailBinding.activityEncyclopediaDetailImageView);

        mEncyclopediaDetailBinding.setEncyclopedia(mEncyclopediaModel);
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        finish();
        return true;
    }
}

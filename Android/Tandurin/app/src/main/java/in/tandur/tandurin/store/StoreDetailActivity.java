package in.tandur.tandurin.store;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import in.tandur.tandurin.R;
import in.tandur.tandurin.databinding.ActivityStoreDetailBinding;
import in.tandur.tandurin.utils.GlideApp;

import static com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions.withCrossFade;

public class StoreDetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_store_detail);

        ActivityStoreDetailBinding mStoreDetailBinding = DataBindingUtil.setContentView(this, R.layout.activity_store_detail);

        Intent intentFromStoreActivity = getIntent();

        int id = intentFromStoreActivity.getIntExtra(StoreConstant.ID, 0);
        int rank = intentFromStoreActivity.getIntExtra(StoreConstant.RANK, 1);
        String imageUrl = intentFromStoreActivity.getStringExtra(StoreConstant.IMAGE_URL);
        String name = intentFromStoreActivity.getStringExtra(StoreConstant.NAME);
        String location = intentFromStoreActivity.getStringExtra(StoreConstant.LOCATION);
        String description = intentFromStoreActivity.getStringExtra(StoreConstant.DESCRIPTION);

        StoreModel mStoreModel = new StoreModel(id, rank, imageUrl, name, location, description);

        setSupportActionBar(mStoreDetailBinding.activityStoreDetailToolbar);

        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayShowHomeEnabled(true);
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setTitle(name);
        }

        GlideApp.with(mStoreDetailBinding.activityStoreDetailImageView)
                .load(imageUrl)
                .transition(withCrossFade())
                .centerCrop()
                .placeholder(R.drawable.ic_local_florist_pink_64dp)
                .into(mStoreDetailBinding.activityStoreDetailImageView);

        mStoreDetailBinding.setStore(mStoreModel);
    }
}

package in.tandur.tandurin.store;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.v4.widget.NestedScrollView;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.ViewTreeObserver;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.UiSettings;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

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
        String lat = intentFromStoreActivity.getStringExtra(StoreConstant.LAT);
        String lng = intentFromStoreActivity.getStringExtra(StoreConstant.LNG);
        String description = intentFromStoreActivity.getStringExtra(StoreConstant.DESCRIPTION);

        StoreModel mStoreModel = new StoreModel(id, rank, imageUrl, name, location, lat, lng, description);

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



        MapView mapView = findViewById(R.id.activity_store_detail_mapView);
        mapView.onCreate(savedInstanceState);
        mapView.getMapAsync(googleMap -> {
            LatLng coordinates = new LatLng(Double.valueOf(lat), Double.valueOf(lng));

            UiSettings mapUiSettings = googleMap.getUiSettings();
            mapUiSettings.setZoomControlsEnabled(true);
            mapUiSettings.setCompassEnabled(true);
            mapUiSettings.setScrollGesturesEnabled(true);
            mapUiSettings.setTiltGesturesEnabled(true);
            mapUiSettings.setRotateGesturesEnabled(true);

            googleMap.addMarker(new MarkerOptions().position(coordinates));
            googleMap.animateCamera(CameraUpdateFactory.newLatLngZoom(coordinates, 15.0f));
            mapView.onResume();
        });

        mStoreDetailBinding.setStore(mStoreModel);


    }
}

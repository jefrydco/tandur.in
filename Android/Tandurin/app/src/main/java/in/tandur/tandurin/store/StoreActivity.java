package in.tandur.tandurin.store;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.SearchView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.Toast;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import in.tandur.tandurin.R;
import in.tandur.tandurin.databinding.ActivityStoreBinding;
import in.tandur.tandurin.utils.DataUtils;
import in.tandur.tandurin.utils.NetworkUtils;
import in.tandur.tandurin.utils.RecyclerItemClickSupportUtils;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class StoreActivity extends AppCompatActivity {

    private static final String TAG = "StoreActivity";

    private StoreService mStoreService;
    private Call<String> mCall;
    private Callback<String> mCallback = new Callback<String>() {
        @Override
        public void onResponse(Call<String> call, Response<String> response) {
            String jsonResponse = response.body();

            Log.d(TAG, "onResponse: jsonResponse: " + jsonResponse);

            try {
                JSONObject rootObject = new JSONObject(jsonResponse);
                JSONArray shopArray = rootObject.getJSONArray("store");

                if (shopArray.length() > 0) {
                    mStoreModelList = new ArrayList<>();

                    for (int index = 0; index < shopArray.length(); index++) {
                        JSONObject shopArrayItem = shopArray.getJSONObject(index);
                        Log.d(TAG, "onResponse: shopArrayItem" + shopArrayItem);

                        int shopId = shopArrayItem.getInt("shop_id");
                        String shopName = shopArrayItem.getString("shop_nama");
                        String shopAddress = shopArrayItem.getString("shop_alamat");
                        String shopInfo = shopArrayItem.getString("shop_info");

                        mStoreModelList.add(new StoreModel(
                                shopId,
                                index,
                                "http://www.greensofhighgate.com/communities/2/004/013/522/962//images/4631215491.jpg",
                                shopName,
                                shopAddress,
                                shopInfo
                        ));
                    }

                    mStoreAdapter.edit()
                            .replaceAll(mStoreModelList)
                            .commit();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        @Override
        public void onFailure(Call<String> call, Throwable t) {

        }
    };

    private static final Comparator<StoreModel> COMPARATOR = new SortedListAdapter.ComparatorBuilder<StoreModel>()
            .setOrderForModel(StoreModel.class, (a, b) -> Integer.signum(a.getRank() - b.getRank()))
            .build();

    private StoreAdapter mStoreAdapter;
    private ActivityStoreBinding mStoreBinding;
    private Animator mAnimator;

    private List<StoreModel> mStoreModelList;

    private SortedListAdapter.Callback mStoreAdapterCallback = new SortedListAdapter.Callback() {
        @Override
        public void onEditStarted() {
            if (mStoreBinding.activityStoreProgressBar.getVisibility() != View.VISIBLE) {
                mStoreBinding.activityStoreProgressBar.setVisibility(View.VISIBLE);
                mStoreBinding.activityStoreProgressBar.setAlpha(0.0f);
            }

            if (mAnimator != null) {
                mAnimator.cancel();
            }

            mAnimator = ObjectAnimator.ofFloat(
                    mStoreBinding.activityStoreProgressBar,
                    View.ALPHA,
                    1.0f);
            mAnimator.setInterpolator(new AccelerateDecelerateInterpolator());
            mAnimator.start();

            mStoreBinding.activityStoreRecyclerView.animate().alpha(0.5f);
        }

        @Override
        public void onEditFinished() {
            mStoreBinding.activityStoreRecyclerView.scrollToPosition(0);
            mStoreBinding.activityStoreRecyclerView.animate().alpha(1.0f);

            if (mAnimator != null) {
                mAnimator.cancel();
            }

            mAnimator = ObjectAnimator.ofFloat(
                    mStoreBinding.activityStoreProgressBar,
                    View.ALPHA,
                    0.0f);
            mAnimator.setInterpolator(new AccelerateDecelerateInterpolator());
            mAnimator.addListener(new AnimatorListenerAdapter() {

                private boolean mCanceled = false;

                @Override
                public void onAnimationCancel(Animator animation) {
                    super.onAnimationCancel(animation);
                    mCanceled = true;
                }

                @Override
                public void onAnimationEnd(Animator animation) {
                    super.onAnimationEnd(animation);
                    if (!mCanceled) {
                        mStoreBinding.activityStoreProgressBar.setVisibility(View.GONE);
                    }
                }
            });
            mAnimator.start();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mStoreBinding = DataBindingUtil.setContentView(this, R.layout.activity_store);

        mStoreAdapter = new StoreAdapter(this, StoreModel.class, COMPARATOR);

        mStoreAdapter.addCallback(mStoreAdapterCallback);

        RecyclerItemClickSupportUtils.addTo(mStoreBinding.activityStoreRecyclerView)
                .setOnItemClickListener((recyclerView, position, v) -> {
                    StoreModel currentStoreModel = mStoreModelList.get(position);
                    Intent intentToStoreDetailActivity = new Intent(
                            this,
                            StoreDetailActivity.class);
                    intentToStoreDetailActivity.putExtra(StoreConstant.ID, currentStoreModel.getId());
                    intentToStoreDetailActivity.putExtra(StoreConstant.RANK, currentStoreModel.getRank());
                    intentToStoreDetailActivity.putExtra(StoreConstant.IMAGE_URL, currentStoreModel.getImageUrl());
                    intentToStoreDetailActivity.putExtra(StoreConstant.NAME, currentStoreModel.getName());
                    intentToStoreDetailActivity.putExtra(StoreConstant.LOCATION, currentStoreModel.getLocation());
                    intentToStoreDetailActivity.putExtra(StoreConstant.DESCRIPTION, currentStoreModel.getDescription());

                    startActivity(intentToStoreDetailActivity);
                });

        mStoreBinding.activityStoreRecyclerView
                .setLayoutManager(new LinearLayoutManager(this));
        mStoreBinding.activityStoreRecyclerView
                .setAdapter(mStoreAdapter);

        mStoreService = (StoreService) NetworkUtils.fetch(StoreService.class);
        mCall = mStoreService.getStoreList();
        mCall.enqueue(mCallback);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_store, menu);

        final MenuItem menuStoreSearch = menu.findItem(R.id.menu_store_search);
        final SearchView searchView = (SearchView) menuStoreSearch.getActionView();
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String query) {
                final List<StoreModel> filteredStoreModelList = filterStoreModelList(mStoreModelList, query);
                mStoreAdapter.edit()
                        .replaceAll(filteredStoreModelList)
                        .commit();
                return true;
            }
        });
        return true;
    }

    private List<StoreModel> filterStoreModelList(List<StoreModel> mStoreModelList, String query) {
        final String lowerCaseQuery = query.toLowerCase();

        final List<StoreModel> filteredStoreModelList = new ArrayList<>();
        for (StoreModel storeModel: mStoreModelList) {
            final String id = String.valueOf(storeModel.getId()).toLowerCase();
            final String rank = String.valueOf(storeModel.getRank()).toLowerCase();
            final String imageUrl = storeModel.getImageUrl().toLowerCase();
            final String name = storeModel.getName().toLowerCase();
            final String location = storeModel.getLocation().toLowerCase();

            if (id.contains(lowerCaseQuery) ||
                    rank.contains(lowerCaseQuery) ||
                    imageUrl.contains(lowerCaseQuery) ||
                    name.contains(lowerCaseQuery) ||
                    location.contains(lowerCaseQuery)) {
                filteredStoreModelList.add(storeModel);
            }
        }

        return filteredStoreModelList;
    }

    private List<StoreModel> generateStoreModelList(int count) {
        List<StoreModel> storeModelList = new ArrayList<>();

        for (int i = 0; i < count; i++) {
            storeModelList.add(new StoreModel(
                    i,
                    i,
                    "https://flowermag.com/wp-content/uploads/2017/08/dahlia.jpg",
                    String.format(
                            Locale.US,
                            "%s %d",
                            DataUtils.toSentenceCase(DataUtils.generateRandomWords(2)),
                            i
                    ),
                    String.format(
                            Locale.US,
                            "%s %d",
                            DataUtils.toSentenceCase(DataUtils.generateRandomWords(2)),
                            i
                    ),
                    String.format(
                            Locale.US,
                            "%s",
                            DataUtils.toSentenceCase(DataUtils.generateRandomWords(100))
                    )
            ));
        }

        return storeModelList;
    }
}

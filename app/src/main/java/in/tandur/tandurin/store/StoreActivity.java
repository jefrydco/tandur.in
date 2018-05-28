package in.tandur.tandurin.store;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.Toast;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import in.tandur.tandurin.R;
import in.tandur.tandurin.databinding.ActivityStoreBinding;
import in.tandur.tandurin.encyclopedia.EncyclopediaModel;
import in.tandur.tandurin.store.StoreModel;
import in.tandur.tandurin.utils.DataUtils;
import in.tandur.tandurin.utils.RecyclerItemClickSupportUtils;

public class StoreActivity extends AppCompatActivity {

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
                    Toast.makeText(
                            this,
                            String.format(
                                    Locale.US,
                                    "%s",
                                    mStoreModelList.get(position).getName()
                            ),
                            Toast.LENGTH_SHORT
                    ).show();
                });

        mStoreBinding.activityStoreRecyclerView
                .setLayoutManager(new LinearLayoutManager(this));
        mStoreBinding.activityStoreRecyclerView
                .setAdapter(mStoreAdapter);

        mStoreModelList = generateStoreModelList(100);
        mStoreAdapter.edit()
                .replaceAll(mStoreModelList)
                .commit();
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

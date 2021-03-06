package in.tandur.tandurin.encyclopedia;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.SearchView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import in.tandur.tandurin.R;
import in.tandur.tandurin.databinding.ActivityEncyclopediaBinding;
import in.tandur.tandurin.utils.DataUtils;
import in.tandur.tandurin.utils.NetworkUtils;
import in.tandur.tandurin.utils.RecyclerItemClickSupportUtils;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class EncyclopediaActivity extends AppCompatActivity {

    private static final String TAG = "EncyclopediaActivity";

    private EncyclopediaService mEncyclopediaService;
    private Call<String> mCall;
    private Callback<String> mCallback = new Callback<String>() {
        @Override
        public void onResponse(@NonNull Call<String> call, Response<String> response) {
            String jsonResponse = response.body();

            try {
                JSONObject rootObject = new JSONObject(jsonResponse);
                JSONArray encyArray = rootObject.getJSONArray("ency");

                if (encyArray.length() > 0) {
                    mEncyclopediaModelList = new ArrayList<>();

                    for (int index = 0; index < encyArray.length(); index++) {
                        JSONObject encyArrayItem = encyArray.getJSONObject(index);

                        int encyId = encyArrayItem.getInt("ency_id");
                        String encyName = encyArrayItem.getString("ency_nama");
                        String encyScientificName = encyArrayItem.getString("ency_latin");
                        String encyImage = NetworkUtils.API_URL + encyArrayItem.getString("ency_image");
                        String encyInfo = encyArrayItem.getString("ency_info");

                        mEncyclopediaModelList.add(new EncyclopediaModel(
                                encyId,
                                index,
                                encyImage,
                                encyName,
                                encyScientificName,
                                encyInfo
                        ));
                    }

                    mEncyclopediaAdapter.edit()
                            .replaceAll(mEncyclopediaModelList)
                            .commit();
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        @Override
        public void onFailure(@NonNull Call<String> call, @NonNull Throwable t) {

        }
    };

    private static final Comparator<EncyclopediaModel> COMPARATOR = new SortedListAdapter.ComparatorBuilder<EncyclopediaModel>()
            .setOrderForModel(EncyclopediaModel.class, (a, b) -> Integer.signum(a.getRank() - b.getRank()))
            .build();

    private EncyclopediaAdapter mEncyclopediaAdapter;
    private ActivityEncyclopediaBinding mEncyclopediaBinding;
    private Animator mAnimator;

    private List<EncyclopediaModel> mEncyclopediaModelList;

    private SortedListAdapter.Callback mEncyclopediaAdapterCallback = new SortedListAdapter.Callback() {
        @Override
        public void onEditStarted() {
            if (mEncyclopediaBinding.activityEncyclopediaProgressBar.getVisibility() != View.VISIBLE) {
                mEncyclopediaBinding.activityEncyclopediaProgressBar.setVisibility(View.VISIBLE);
                mEncyclopediaBinding.activityEncyclopediaProgressBar.setAlpha(0.0f);
            }

            if (mAnimator != null) {
                mAnimator.cancel();
            }

            mAnimator = ObjectAnimator.ofFloat(
                    mEncyclopediaBinding.activityEncyclopediaProgressBar,
                    View.ALPHA,
                    1.0f);
            mAnimator.setInterpolator(new AccelerateDecelerateInterpolator());
            mAnimator.start();

            mEncyclopediaBinding.activityEncyclopediaRecyclerView.animate().alpha(0.5f);
        }

        @Override
        public void onEditFinished() {
            mEncyclopediaBinding.activityEncyclopediaRecyclerView.scrollToPosition(0);
            mEncyclopediaBinding.activityEncyclopediaRecyclerView.animate().alpha(1.0f);

            if (mAnimator != null) {
                mAnimator.cancel();
            }

            mAnimator = ObjectAnimator.ofFloat(
                    mEncyclopediaBinding.activityEncyclopediaProgressBar,
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
                        mEncyclopediaBinding.activityEncyclopediaProgressBar.setVisibility(View.GONE);
                    }
                }
            });
            mAnimator.start();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mEncyclopediaBinding = DataBindingUtil.setContentView(this, R.layout.activity_encyclopedia);

        mEncyclopediaAdapter = new EncyclopediaAdapter(this, EncyclopediaModel.class, COMPARATOR);

        mEncyclopediaAdapter.addCallback(mEncyclopediaAdapterCallback);

        RecyclerItemClickSupportUtils.addTo(mEncyclopediaBinding.activityEncyclopediaRecyclerView)
                .setOnItemClickListener((recyclerView, position, v) -> {
                    EncyclopediaModel currentEncyclopediaModel = mEncyclopediaModelList.get(position);
                    Intent intentToEncyclopediaDetailActivity = new Intent(
                            this,
                            EncyclopediaDetailActivity.class);
                    intentToEncyclopediaDetailActivity.putExtra(
                            EncyclopediaConstant.ID, currentEncyclopediaModel.getId());
                    intentToEncyclopediaDetailActivity.putExtra(
                            EncyclopediaConstant.RANK, currentEncyclopediaModel.getRank());
                    intentToEncyclopediaDetailActivity.putExtra(
                            EncyclopediaConstant.IMAGE_URL, currentEncyclopediaModel.getImageUrl());
                    intentToEncyclopediaDetailActivity.putExtra(
                            EncyclopediaConstant.REGULAR_NAME, currentEncyclopediaModel.getRegularName());
                    intentToEncyclopediaDetailActivity.putExtra(
                            EncyclopediaConstant.SCIENTIFIC_NAME, currentEncyclopediaModel.getScientificName());
                    intentToEncyclopediaDetailActivity.putExtra(
                            EncyclopediaConstant.DESCRIPTION, currentEncyclopediaModel.getDescription());

                    startActivity(intentToEncyclopediaDetailActivity);
                });

        mEncyclopediaBinding.activityEncyclopediaRecyclerView
                .setLayoutManager(new LinearLayoutManager(this));
        mEncyclopediaBinding.activityEncyclopediaRecyclerView
                .setAdapter(mEncyclopediaAdapter);

        mEncyclopediaService = (EncyclopediaService) NetworkUtils.fetch(EncyclopediaService.class);
        mCall = mEncyclopediaService.getEncyclopediaList();
        mCall.enqueue(mCallback);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_encyclopedia, menu);

        final MenuItem menuEncyclopediaSearch = menu.findItem(R.id.menu_encyclopedia_search);
        final SearchView searchView = (SearchView) menuEncyclopediaSearch.getActionView();
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String query) {
                final List<EncyclopediaModel> filteredEncyclopediaModelList = filterEncyclopediaModelList(mEncyclopediaModelList, query);
                mEncyclopediaAdapter.edit()
                        .replaceAll(filteredEncyclopediaModelList)
                        .commit();
                return true;
            }
        });
        return true;
    }

    private List<EncyclopediaModel> filterEncyclopediaModelList(List<EncyclopediaModel> mEncyclopediaModelList, String query) {
        final String lowerCaseQuery = query.toLowerCase();

        final List<EncyclopediaModel> filteredEncyclopediaModelList = new ArrayList<>();
        for (EncyclopediaModel encyclopediaModel: mEncyclopediaModelList) {
            final String id = String.valueOf(encyclopediaModel.getId()).toLowerCase();
            final String rank = String.valueOf(encyclopediaModel.getRank()).toLowerCase();
            final String imageUrl = encyclopediaModel.getImageUrl().toLowerCase();
            final String regularName = encyclopediaModel.getRegularName().toLowerCase();
            final String scientificName = encyclopediaModel.getScientificName().toLowerCase();

            if (id.contains(lowerCaseQuery) ||
                    rank.contains(lowerCaseQuery) ||
                    imageUrl.contains(lowerCaseQuery) ||
                    regularName.contains(lowerCaseQuery) ||
                    scientificName.contains(lowerCaseQuery)) {
                filteredEncyclopediaModelList.add(encyclopediaModel);
            }
        }

        return filteredEncyclopediaModelList;
    }

    private List<EncyclopediaModel> generateEncyclopediaModelList(int count) {
        List<EncyclopediaModel> encyclopediaModelList = new ArrayList<>();

        for (int i = 0; i < count; i++) {
            encyclopediaModelList.add(new EncyclopediaModel(
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

        return encyclopediaModelList;
    }
}

package in.tandur.tandurin.store;

import android.support.annotation.NonNull;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

public class StoreModel implements SortedListAdapter.ViewModel {
    private final int mId;
    private final int mRank;
    private final String mImageUrl;
    private final String mName;
    private final String mLocation;
    private final String mLat;
    private final String mLng;
    private final String mDescription;

    public StoreModel(int mId, int mRank, String mImageUrl, String mName, String mLocation, String mLat, String mLng, String mDescription) {
        this.mId = mId;
        this.mRank = mRank;
        this.mImageUrl = mImageUrl;
        this.mName = mName;
        this.mLocation = mLocation;
        this.mLat = mLat;
        this.mLng = mLng;
        this.mDescription = mDescription;
    }


    @Override
    public <T> boolean isSameModelAs(@NonNull T model) {
        if (model instanceof StoreModel) {
            final StoreModel otherStoreModel = (StoreModel) model;
            return this.mId == otherStoreModel.mId;
        }
        return false;
    }

    @Override
    public <T> boolean isContentTheSameAs(@NonNull T model) {
        if (model instanceof StoreModel) {
            final StoreModel otherStoreModel = (StoreModel) model;
            return this.mRank == otherStoreModel.mRank &&
                    (this.mName != null ?
                        this.mName.equals(otherStoreModel.mName) :
                        otherStoreModel.mName == null);
        }
        return false;
    }

    public int getId() {
        return mId;
    }

    public int getRank() {
        return mRank;
    }

    public String getImageUrl() {
        return mImageUrl;
    }

    public String getName() {
        return mName;
    }

    public String getLocation() {
        return mLocation;
    }

    public String getLat() {
        return mLat;
    }

    public String getLng() {
        return mLng;
    }

    public String getDescription() {
        return mDescription;
    }
}

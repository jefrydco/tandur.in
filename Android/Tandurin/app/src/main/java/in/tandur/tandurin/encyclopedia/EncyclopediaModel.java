package in.tandur.tandurin.encyclopedia;

import android.support.annotation.NonNull;

import com.github.wrdlbrnft.sortedlistadapter.SortedListAdapter;

public class EncyclopediaModel implements SortedListAdapter.ViewModel {
    private final int mId;
    private final int mRank;
    private final String mImageUrl;
    private final String mRegularName;
    private final String mScientificName;
    private final String mDescription;

    public EncyclopediaModel(int mId, int mRank, String mImageUrl, String mRegularName, String mScientificName, String mDescription) {
        this.mId = mId;
        this.mRank = mRank;
        this.mImageUrl = mImageUrl;
        this.mRegularName = mRegularName;
        this.mScientificName = mScientificName;
        this.mDescription = mDescription;
    }

    @Override
    public <T> boolean isSameModelAs(@NonNull T model) {
        if (model instanceof EncyclopediaModel) {
            final EncyclopediaModel otherEncyclopediaModel = (EncyclopediaModel) model;
            return this.mId == otherEncyclopediaModel.mId;
        }
        return false;
    }

    @Override
    public <T> boolean isContentTheSameAs(@NonNull T model) {
        if (model instanceof EncyclopediaModel) {
            final EncyclopediaModel otherEncyclopediaModel = (EncyclopediaModel) model;
            return this.mRank == otherEncyclopediaModel.mRank &&
                    (this.mRegularName != null ?
                            this.mRegularName.equals(otherEncyclopediaModel.mRegularName) :
                            otherEncyclopediaModel.mRegularName == null);
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

    public String getRegularName() {
        return mRegularName;
    }

    public String getScientificName() {
        return mScientificName;
    }

    public String getDescription() {
        return mDescription;
    }
}

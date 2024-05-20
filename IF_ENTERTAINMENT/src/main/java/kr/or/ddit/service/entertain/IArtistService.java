package kr.or.ddit.service.entertain;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.entertain.AlbumVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.entertain.ArtistVO;
import kr.or.ddit.vo.entertain.TrackListVO;

public interface IArtistService {

	public List<AlbumVO> albumList(String agId);
	public List<TrackListVO> selectAlbum(int alNo);
	public AlbumVO albumDetail(int alNo);
	public ArtistGroupVO profileList(String agId);
	public List<ArtistVO> artistSelect(String agId);
	public List<ArtistGroupVO> artistList();
	public List<ArtistGroupVO> adminList(PaginationInfoVO<ArtistGroupVO> pagingVO);
	public List<ArtistVO> adminArtistList();
	public int selectArtistListCount(PaginationInfoVO<ArtistGroupVO> pagingVO);
	public ServiceResult deleteArtist(HttpServletRequest req, String agId);
	public List<UserVO> aritstListForm();
	public void groupInsert(ArtistGroupVO artistGroupVO1, HttpServletRequest req);
	public void insert(List<ArtistVO> artistList);
	public ArtistGroupVO artistGroupSelect(String agId);
	public List<ArtistVO> artistMemberSelect(String agId);
	public void memberInsert(ArtistVO artistVO);
	public void memberDelete(ArtistVO artistVO);
	public void groupUpdate(ArtistGroupVO artistGroupVO1, HttpServletRequest req);
	public void memberUpdate(List<ArtistVO> artistList, HttpServletRequest req);
	public ServiceResult albumUpdate(AlbumVO albumVO, HttpServletRequest req);
	public int albumInsert(AlbumVO albumVO, HttpServletRequest req, List<String> trackNames);
	public int albumDelete(int alNo);

}

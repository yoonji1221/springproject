package review;

public class ReviewVO {

   int rid;
   String title;
   int mid;
   String contents;
   int viewcount;
   String time;
   String name;
   String progrmSj;
   
   

   public int getRid() {
      return rid;
   }
   public void setRid(int rid) {
      this.rid = rid;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public int getMid() {
      return mid;
   }
   public void setMid(int mid) {
      this.mid = mid;
   }
   public String getContents() {
      return contents;
   }
   public void setContents(String contents) {
      this.contents = contents;
   }
   public int getViewcount() {
      return viewcount;
   }
   public void setViewcount(int viewcount) {
      this.viewcount = viewcount;
   }
   public String getTime() {
      return time;
   }
   public void setTime(String time) {
      this.time = time;
   }
   
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getProgrmSj() {
      return progrmSj;
   }
   public void setProgrmSj(String progrmSj) {
      this.progrmSj = progrmSj;
   }

}
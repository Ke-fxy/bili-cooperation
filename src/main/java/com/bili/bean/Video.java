package com.bili.bean;

/**
 * @author Ihlov
 */
public class Video {
        private Integer id;

        private String vName;

        private String vPath;

        private Integer vAuthor;

        private String vImg;

        private String zone;

        private String introduction;

        public String getIntroduction() {
                return introduction;
        }

        public void setIntroduction(String introduction) {
                this.introduction = introduction;
        }

        public Integer getId() {
                return id;
        }

        public void setId(Integer id) {
                this.id = id;
        }

        public String getvName() {
                return vName;
        }

        public void setvName(String vName) {
                this.vName = vName;
        }

        public String getvPath() {
                return vPath;
        }

        public void setvPath(String vPath) {
                this.vPath = vPath;
        }

        public Integer getvAuthor() {
                return vAuthor;
        }

        public void setvAuthor(Integer vAuthor) {
                this.vAuthor = vAuthor;
        }

        public String getvImg() {
                return vImg;
        }

        public void setvImg(String vImg) {
                this.vImg = vImg;
        }

        public String getZone() {
                return zone;
        }

        public void setZone(String zone) {
                this.zone = zone;
        }

        public Video() {
        }

        public Video(Integer id, String vName, String vPath, Integer vAuthor, String vImg, String zone, String introduction) {
                this.id = id;
                this.vName = vName;
                this.vPath = vPath;
                this.vAuthor = vAuthor;
                this.vImg = vImg;
                this.zone = zone;
                this.introduction = introduction;
        }

        @Override
        public String toString() {
                return "Video{" +
                        "id=" + id +
                        ", vName='" + vName + '\'' +
                        ", vPath='" + vPath + '\'' +
                        ", vAuthor=" + vAuthor +
                        ", vImg='" + vImg + '\'' +
                        ", zone='" + zone + '\'' +
                        ", introduction='" + introduction + '\'' +
                        '}';
        }
}

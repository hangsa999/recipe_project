package com.study.member.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberVO {
    private String memId;
    private String memPass;
    private String memName;
    private String memBir;
    private String memZip;
    private String memAdd1;
    private String memAdd2;
    private String memHp;
    private String memMail;
    private String memJob;
    private String memHobby;
    private int memMileage;
    private String memDelYn;

    private String memJobNm;            /* 직업명 */
    private String memHobbyNm;            /* 취미 */

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public String getMemId() {
        return memId;
    }

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPass() {
        return memPass;
    }

    public void setMemPass(String memPass) {
        this.memPass = memPass;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemBir() {
        return memBir;
    }

    public void setMemBir(String memBir) {
        this.memBir = memBir;
    }

    public String getMemZip() {
        return memZip;
    }

    public void setMemZip(String memZip) {
        this.memZip = memZip;
    }

    public String getMemAdd1() {
        return memAdd1;
    }

    public void setMemAdd1(String memAdd1) {
        this.memAdd1 = memAdd1;
    }

    public String getMemAdd2() {
        return memAdd2;
    }

    public void setMemAdd2(String memAdd2) {
        this.memAdd2 = memAdd2;
    }

    public String getMemHp() {
        return memHp;
    }

    public void setMemHp(String memHp) {
        this.memHp = memHp;
    }

    public String getMemMail() {
        return memMail;
    }

    public void setMemMail(String memMail) {
        this.memMail = memMail;
    }

    public String getMemJob() {
        return memJob;
    }

    public void setMemJob(String memJob) {
        this.memJob = memJob;
    }

    public String getMemHobby() {
        return memHobby;
    }

    public void setMemHobby(String memHobby) {
        this.memHobby = memHobby;
    }

    public int getMemMileage() {
        return memMileage;
    }

    public void setMemMileage(int memMileage) {
        this.memMileage = memMileage;
    }

    public String getMemDelYn() {
        return memDelYn;
    }

    public void setMemDelYn(String memDelYn) {
        this.memDelYn = memDelYn;
    }

    public String getMemJobNm() {
        return memJobNm;
    }

    public void setMemJobNm(String memJobNm) {
        this.memJobNm = memJobNm;
    }

    public String getMemHobbyNm() {
        return memHobbyNm;
    }

    public void setMemHobbyNm(String memHobbyNm) {
        this.memHobbyNm = memHobbyNm;
    }

}

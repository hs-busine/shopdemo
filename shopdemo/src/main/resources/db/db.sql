/*
작성자 : 오현수
편집일 : 2022-07-05
프로젝트명 : 쇼핑몰DEMO
*/

-- 테이블 생성
/* 1. 회원가입 테이블 */
CREATE TABLE TBL_MB(
    MB_ID           VARCHAR2(15)    CONSTRAINT MB_ID_PK PRIMARY KEY,
    MB_NM           VARCHAR2(30)    NOT NULL,
    MB_PW           VARCHAR2(60)    NOT NULL,
    MB_ZCD          CHAR(5)         NOT NULL,
    MB_ADDR         VARCHAR2(100)   NOT NULL,
    MB_ADDR_DTL     VARCHAR2(100)   NOT NULL,
    MB_PN           VARCHAR2(15)    NOT NULL,
    MB_NICK         VARCHAR2(20)    NOT NULL UNIQUE,
    MB_EML          VARCHAR2(50)    NOT NULL UNIQUE,
    MB_EML_RCV      CHAR(1)         NOT NULL,
    MB_POINT        NUMBER          NOT NULL,
    MB_DT_JO        DATE            NOT NULL,
    MB_DT_UP        DATE            NOT NULL,
    MB_DT_LA        DATE            NOT NULL
);

/* 2. 카테고리 테이블 */
CREATE TABLE TBL_CTGR(
    CTGR_CD       	NUMBER          CONSTRAINT CTGR_CD_PK  	PRIMARY KEY,
    CTGR_CD_PRT     NUMBER,                                          
    CTGR_NM         VARCHAR2(50)    NOT NULL
);

/* 3. 상품 테이블 */
CREATE TABLE TBL_PRDC(
    PRDC_NM			    NUMBER		                CONSTRAINT PRDC_NM_PK	PRIMARY KEY,
    CG_CODE_FST			NUMBER						NOT NULL,
    CG_CODE_SCD			NUMBER						NOT NULL,
    PRDC_NM				VARCHAR2(50)				NOT NULL,
    PRDC_PRC			NUMBER						NOT NULL,
    PRDC_DSCT			NUMBER						NOT NULL,
    PRDC_COM			VARCHAR2(30)				NOT NULL,
    PRDC_DTL			CLOB						NOT NULL,
    PRDC_IMG			VARCHAR2(50)				NOT NULL,
    PRDC_STK			NUMBER						NOT NULL,
    PRDC_AMT			CHAR(1)						NOT NULL,
    PRDC_DT_RGS	    	DATE DEFAULT SYSDATE	    NOT NULL,
    PRDC_DT_UP			DATE DEFAULT SYSDATE		NOT NULL
);

/* 4. 장바구니 테이블 */
CREATE TABLE TBL_CART(
    CART_CD		    NUMBER		    CONSTRAINT CART_CD_PK	PRIMARY KEY,			
	PRDC_NM			NUMBER			NOT NULL,
	MB_ID			VARCHAR2(20)	NOT NULL,
	CART_AMT		NUMBER			NOT NULL
);

/* 5. 주문 테이블 */
CREATE TABLE TBL_ODR(
    ODR_NM			    NUMBER		            	CONSTRAINT ODR_NM_PK	PRIMARY KEY,
	MB_ID				VARCHAR2(20)				NOT NULL,
	ODR_NM				VARCHAR2(30)				NOT NULL,
	ODR_ZCD		    	CHAR(5)						NOT NULL,
	ODR_ADDR			VARCHAR2(50)				NOT NULL,
	ODR_ADDR_DTL		VARCHAR2(50)				NOT NULL,
	ODR_PN				VARCHAR2(20)				NOT NULL,
	ODR_PRC				NUMBER						NOT NULL,
	ODR_DT				DATE DEFAULT SYSDATE		NOT NULL
);

/* 6. 주문 상세 테이블 */
CREATE TABLE TBL_ORD_DTL(
	ODR_NM			NUMBER      CONSTRAINT ODR_DTL_NM_PK	NOT NULL,
	PRDC_NM			NUMBER		NOT NULL,
	ODR_AMT		    NUMBER		NOT NULL,
	ODR_PRC			NUMBER		NOT NULL,
	PRIMARY KEY (ODR_NM_PK, PRDC_NM_PK) 
);

/* 7. 게시판 테이블 */
CREATE TABLE TBL_BRD(
	BRD_NM			NUMBER				        CONSTRAINT BRD_NM_PK	PRIMARY KEY,
	MB_ID			VARCHAR2(20)				NOT NULL,
	BRD_TLE			VARCHAR2(100)				NOT NULL,
	BRD_CNT			VARCHAR2(4000)				NOT NULL,
	BRD_DT_REG		DATE DEFAULT SYSDATE		NOT NULL
);

/* 8. 상품후기 테이블 */
CREATE TABLE TBL_PRDC_RVW(
	RVW_NM		    NUMBER			            CONSTRAINT RVW_NM_PK	PRIMARY KEY,
	MB_ID			VARCHAR2(20)				NOT NULL,
	PRDC_NM			NUMBER						NOT NULL,
	RVW_CNT			VARCHAR2(200)				NOT NULL,
	RVW_SCO			NUMBER						NOT NULL,
	RVW_DT_REG		DATE DEFAULT SYSDATE		NOT NULL
);

/* 9. 관리자 테이블 */
CREATE TABLE TBL_ADM(
	ADM_ID			VARCHAR2(15)	        	CONSTRAINT ADM_ID_PK	PRIMARY KEY,
	ADM_PW			VARCHAR2(30)				NOT NULL,
	ADM_NM		    VARCHAR2(100)				NOT NULL,
    ADM_DT_LA		DATE DEFAULT SYSDATE		NOT NULL
);

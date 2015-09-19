class NambiController < ApplicationController
    
    def index
    end
    
    #login session 처리
    def login_process
        @user = User.where(:userId => params[:userId]).take
        if @user.nil? #db 회원에 없는 id 입니다.
           redirect_to "/", alert: '존재하지 않는 Email입니다.'
        elsif @user.userPw != params[:userPw]
            redirect_to "/", alert: '비밀번호가 일치하지 않습니다.'
           
        else 
            #login session OK -> 메인페이지 이동
            session["userId"] = @user.id
            redirect_to '/nambi/mainpage' and '/nambi/write'
        end
    end
    
    def mainpage
        #초기화 initialize userId 박는 코드 <%= @userId %>
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
            
        end
        
        #수정 노노
        #user 안에 url이 있는거니까 
        @url = User.find(session["userId"]).urls.all
        #1. 가장 최신 태그 -> 10개
        # DB SELECT해올때 개수제한을 주고 싶다면 --> .limit(개수) 를 해준다 
        # 세션 유지된 상태에서 완료
        @tagLatest =Url.joins(:tags).where(user_id: session["userId"]).limit(15).uniq
        # 중복체크하며 값 담아줄 새 배열 생성해
        @origin = Array.new
        
        #2. 가장 최빈 태그 
        # .count먹여서 숫자 가장많은거 --> 최상위 하나만 뽑는거니까 limit(1)
        # 세션 유지된 상태에서 완료
        @tagMost= Url.joins(:tags).where(user_id: session["userId"]).group('tagName').order('count_id DESC').limit(2).count(:id)
    end

    def data
        #수정 노노
        #session 된 상태의 userId와 category:1 을 가져온다 
        @url = Url.where(user_id: session["userId"], category: 1)        
        
        #초기화 initialize userId 박는 코드 <%= @userId %>
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        
        #1. 가장 최신 태그 -> 10개
        # DB SELECT해올때 개수제한을 주고 싶다면 --> .limit(개수) 를 해준다 
        # 세션 유지된 상태에서 완료
        @tagLatest =Url.joins(:tags).where(user_id: session["userId"]).limit(20).uniq
        # 중복체크하며 값 담아줄 새 배열 생성해
        @origin = Array.new
        #2. 가장 최빈 태그 
        # .count먹여서 숫자 가장많은거 --> 최상위 하나만 뽑는거니까 limit(1)
        # 세션 유지된 상태에서 완료
        @tagMost= Url.joins(:tags).where(user_id: session["userId"]).group('tagName').order('count_id DESC').limit(2).count(:id)
    end
    
    
    def bookmark
        #수정 노노
        #session 된 상태의 userId와 category:2 를 가져온다 
        @url = Url.where(user_id: session["userId"], category: 2)
        
        #초기화 initialize userId 박는 코드 <%= @userId %>
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
            
        end
        
        #1. 가장 최신 태그 -> 10개
        # DB SELECT해올때 개수제한을 주고 싶다면 --> .limit(개수) 를 해준다 
        # 세션 유지된 상태에서 완료
        @tagLatest =Url.joins(:tags).where(user_id: session["userId"]).limit(20).uniq
        # 중복체크하며 값 담아줄 새 배열 생성해
        @origin = Array.new
        #2. 가장 최빈 태그 
        # .count먹여서 숫자 가장많은거 --> 최상위 하나만 뽑는거니까 limit(1)
        # 세션 유지된 상태에서 완료
        @tagMost= Url.joins(:tags).where(user_id: session["userId"]).group('tagName').order('count_id DESC').limit(2).count(:id)
    end
    
    def image
        #수정 노노
        #session 된 상태의 userId와 category:3 을 가져온다 
        @url = Url.where(user_id: session["userId"], category: 3)
        
        #초기화 initialize userId 박는 코드 <%= @userId %>
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
            
        end
        #1. 가장 최신 태그 -> 10개
        # DB SELECT해올때 개수제한을 주고 싶다면 --> .limit(개수) 를 해준다 
        # 세션 유지된 상태에서 완료
        @tagLatest =Url.joins(:tags).where(user_id: session["userId"]).limit(20).uniq
        # 중복체크하며 값 담아줄 새 배열 생성해
        @origin = Array.new
        #2. 가장 최빈 태그 
        # .count먹여서 숫자 가장많은거 --> 최상위 하나만 뽑는거니까 limit(1)
        # 세션 유지된 상태에서 완료
        @tagMost= Url.joins(:tags).where(user_id: session["userId"]).group('tagName').order('count_id DESC').limit(2).count(:id)
    end

    def insight
        #초기화 initialize userId 박는 코드 <%= @userId %>
        #@userTag = Tag.where(user_id: session["userId"])
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        
        # 해시태그 전체 출력
        #@userTag = Url.joins(:tags).where(user_id: session["userId"]).distinct
        
        #자음 --> insight 기본출력 
        #1. "ㄱ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr01 = Url.joins(:tags).where(user_id: session["userId"]).distinct
        
    end
    
    #태그 검색 결과창 
    def tagresult
        #수정 노노
        #session 된 상태의 userId와 tags.tagName: params[:tagSearch] 인것을 가지고 온다.
        
        @tagSearch = params[:tagSearch]
        @url = Url.joins(:tags).where(user_id: session["userId"], tags:{tagName: @tagSearch}).take
        if @url.nil?
            @showno = "존재하지 않는 태그입니다."
        else
            @showyes = @tagSearch+" 에 대한 검색결과입니다. "
            @url = Url.joins(:tags).where(user_id: session["userId"], tags:{tagName: @tagSearch})
        end
        #초기화 initialize userId 박는 코드 <%= @userId %>
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #1. 가장 최신 태그 -> 10개
        # DB SELECT해올때 개수제한을 주고 싶다면 --> .limit(개수) 를 해준다 
        # 세션 유지된 상태에서 완료
        @tagLatest =Url.joins(:tags).where(user_id: session["userId"]).limit(20).uniq
        # 중복체크하며 값 담아줄 새 배열 생성해
        @origin = Array.new
        #2. 가장 최빈 태그 
        # .count먹여서 숫자 가장많은거 --> 최상위 하나만 뽑는거니까 limit(1)
        # 세션 유지된 상태에서 완료
        @tagMost= Url.joins(:tags).where(user_id: session["userId"]).group('tagName').order('count_id DESC').limit(2).count(:id)
    end
    
    
    def write
        #세션 된 user_id를 입력창에서 input=hidden 으로 넘겨주니까 
        #수정 노노
        url=Url.new
        url.user_id = params[:user_id]
        url.category = params[:category]
        url.urlTitle = params[:urlTitle]
        url.urlLink = params[:urlLink]
        url.memo    = params[:memo]
        url.tagFirst  = params[:tagFirst]
        url.star    = params[:star]
        # 입력창에서 1,2,3이런 식으로 받아온거를
        new_tags = params[:tagName] #1,2,3
        # ','를 기준으로 잘라서 + 빈 공백은 제거하며 list형태로 넣어준다
        new_tag_list = new_tags.gsub(" ","") #1. 빈 공백 제거: replace==gsub
        new_tag_list = new_tag_list.split(",") #2. [1,2,3] --> ","" 기준으로 string token
        # 반복문 돌리면서 Tag db에 넣고 + url 테이블이랑 이어준다 
        new_tag_list.each do |t|
            created = Tag.create(:tagName => t)
            # #Tag<id:1 , tagName :1>
            url.tags << created
        end
        
        print url.tags
        # [#Tag<id:1>, #Tag<id:2>] --> db이어졌음 ㅇㅋ 
        url.save
       
        redirect_to :back
    end

    
    def join
    end
    
    def join_process
        user_exist = User.find_by_userId(params[:userId]) #이미 DB에 userId 존재함
        if user_exist
            redirect_to '/nambi/join', alert: '이미 존재하는 ID입니다.'
        else
        user=User.new
        user.userId =params[:userId]
        user.userName = params[:userName]
        user.userPw =params[:userPw]
        user.save
        redirect_to '/'
        end
    end
    
    def logout
        reset_session
        #logout버튼 누르면 맨 첨 index페이지로 돌아가
        redirect_to '/nambi/index'
    end

    def find_pw
    end
    
    #mailers/send_mail/reset_pw_email 를 바로 발송
    def reset_pw_email_send
        SendMail.reset_pw_email.deliver_now
        redirect_to '/'
    end
    
    #수정페이지 
    #코드수정 노노!!!!!!!!
    def update
        #완전중요!!!!! 수정할 값만 넣어줘야함!! user_id 가 비어있으면 nil이 되서 timeline이 날라가!!!!!!
        #글 id 뽑아와서 
        url_m = Url.find(params[:id])
        #r수정할 3개의 값을 넣어!!!! 
        #json에서 data: {이름} 이거랑 같아야해!!!!!!!!!!!!!! 
        url_m.urlLink = params[:urlLink]
        url_m.urlTitle = params[:urlTitle]
        url_m.memo = params[:memo]
        #url_m.tags = params[:tagName]
        url_m.save
        #json 보내준게 잘 갔는지 확인해줘야지 
        #ajax쓰는게 페이지 이동안하려고 하는거니까 redirect_to 쓰지마 
        render :json => {"result" => "success", "url" => url_m}
    end
    
    def delete
        # 수정노노- 삭제기능 test완료 
        #mainpage에서 특정 url의 id를 인자로 받아와서
        #그걸 삭제해준다 
        @url = Url.find(params[:id])
        @url.destroy
        #redirect_to '/nambi/mainpage'
        redirect_to :back
    end

    #자음 
    def kr_01
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #1. "ㄱ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr01 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_02
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #2. "ㄴ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr02 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_03
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #3. "ㄷ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr03 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_04
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #4. "ㄹ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr04 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_05
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #5. "ㅁ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr05 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_06
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #6. "ㅂ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr06 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_07
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #7. "ㅅ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr07 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_08
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #8. "ㅇ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr08 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_09
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #9. "ㅈ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr09 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_10
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #10. "ㅊ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr10 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_11
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #11. "ㅋ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr11 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_12
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #12. "ㅌ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr12 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_13
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #13. "ㅍ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr13 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def kr_14
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #14. "ㅎ" 로시작하는 --> 세션 완료
        @origin = Array.new
        @findkr14 = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    
    
    #abc
    def eng_a
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #1. "a"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_a = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_b
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #2. "b"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_b = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_c
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #3. "c"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_c = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_d
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #4. "d"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_d = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_e
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #5. "e"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_e = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_f
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #6. "f"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_f = Url.joins(:tags).where(user_id: session["userId"]).distinct    
    end
    def eng_g
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #7. "g"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_g = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_h
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #8. "h"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_h = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_i
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #9. "i"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_i = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_j
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #10. "j"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_j = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end    
    def eng_k
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #11. "k"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_k = Url.joins(:tags).where(user_id: session["userId"]).distinct
    end
    def eng_l
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #12. "l"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_l = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_m
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #13. "m"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_m = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_n
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #14. "n"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_n = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_o
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #15. "o"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_o = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_p
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #16. "k"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_p = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_q
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #17. ""q  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_q = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_r
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #18. "r"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_r = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_s
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #19. "s"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_s = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_t
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #20. "t"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_t = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_u
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #21. "u"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_u = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_v
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #22. "v"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_v = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    
    def eng_w
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #23. "w"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_w = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_x
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #24. "x"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_x = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_y
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #25. "y"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_y = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
    def eng_z
        @userId = ""
        unless session["userId"].nil? 
            #수정노노
            #로그아웃 옆에 email밖기
            @userId = User.find(session["userId"]).userId
            #당신의 url개수는 몇개입니까 할때 이름/url개수 밖기
            @userName = User.find(session["userId"]).userName
            @userUrl = Url.where(user_id: session["userId"]).count
        end
        #26. "k"  로시작하는 --> 세션 완료
        @origin = Array.new
        @findeng_z = Url.joins(:tags).where(user_id: session["userId"]).distinct
    
    end
end 

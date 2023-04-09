import 'package:flutter_html/flutter_html.dart';

import 'package:mobile_front_end/pages/learn/grammar/models/grammar_category.dart';
import 'package:mobile_front_end/pages/learn/grammar/models/tense_category.dart';
import 'package:mobile_front_end/pages/learn/grammar/models/types_of_word_category.dart';

const GRAMMAR_CATEGORIES = const [
  GrammarCategory(
      id: '1',
      title: 'Tenses',
      content: ''),
  GrammarCategory(
      id: '2',
      title: 'Types of Words', content: ''),
  GrammarCategory(
      id: '3',
      title: 'Comparison Sentences',
      content: '''
      <html>
        <body>
          <h1>1. So sánh bằng</h1>
          <h2>1.1. So sánh bằng với tính từ và trạng từ</h2>
          Công thức: S + V + as + (adj/ adv) + as
          <br>Ví dụ:
          <ul>
            <li>I’m as good in Maths as in science.</li>
            <li>Harry sings as beautifully as a singer.</li>
            <li>This picture is as colorful as the one I have ever seen. </li>
          </ul>
          <h2>So sánh bằng với danh từ</h2>
          Công thức: S + V + the same + (noun) + as
          <br>Ví dụ:
          <ul>
            <li>She takes the same course as her colleague.</li>
            <li>She speaks the same language as her father.</li>
            <li>I wore the same dress as my sister at her birthday party.</li>
          </ul>
          <h1>2. So sánh hơn</h1>
          <h2>2.1. So sánh hơn với tính từ và trạng từ ngắn</h2>
          Công thức: S + V + (Adj/Adv) + “-er” + than
          <br>Ví dụ:
          <ul>
            <li>Jennie’s grades are higher than her sister’s.</li>
            <li>Today is colder than yesterday.</li>
            <li>Lindy is shorter than her younger sister.</li>
          </ul>
          <h2>2.2. So sánh hơn với tính từ và trạng từ dài</h2>
          Công thức: S + V + more + Adj/Adv + than
          <br>Ví dụ:
          <ul>
            <li>He is a more professional soccer than me.</li>
            <li>She visits her family less frequently than I used to.</li>
            <li>My father drives more carefully than my brother.</li>
          </ul>
          <h1>3. So sánh hơn nhất</h1>
          <h2>3.1. So sánh hơn nhất với tính từ và trạng từ ngắn</h2>
          Công thức: S + V + the + Adj/Adv + -est
          <br>Ví dụ:
          <ul>
            <li>My brother is the tallest in our family.</li>
            <li>Sunday is the coldest day of the month so far.</li>
            <li>Linda is the youngest person in my office.</li>
          </ul>
          <h2>3.2. So sánh hơn nhất với tính từ và trạng từ dài</h2>
          Công thức: S + V + the + most + Adj/Adv
          <br>Ví dụ:
          <ul>
            <li>The most boring thing about English course is doing grammar exercises.</li>
            <li>Linda is the most intelligent student in my class.</li>
            <li>This is the most difficult case we have ever encountered.</li>
          </ul>
          <h1>4. Một số tính từ và trạng từ đặc biệt trong câu so sánh</h1>
          <table>
          <tr>
          <th></th>
          <th>So sánh hơn</th>
          <th>So sánh hơn nhất</th>
          </tr>
          <tr>
          <td>good/well</td>
          <td>better</td>
          <td>best</td>
          </tr>
          <tr>
          <td>bad/badly</td>
          <td>worse</td>
          <td>worst</td>
          </tr>
          <tr>
          <td>little</td>
          <td>less</td>
          <td>least</td>
          </tr>
          <tr>
          <td>many/much</td>
          <td>more</td>
          <td>most</td>
          </tr>
          <tr>
          <td>far</td>
          <td>further/farther</td>
          <td>furthest/farthest</td>
          </tr>
          </table>
          <br><br><br>
        </body>
      </html>
      ''',),
  GrammarCategory(
      id: '4',
      title: 'Conditional Sentences',
      content: '''
      <html>
        <body>
          <h1>1. Khái niệm</h1>
          - Câu điều kiện dùng để diễn đạt, giải thích về một sự việc nào đó có thể xảy ra khi điều kiện nói đến xảy ra. Một câu điều kiện có hai mệnh đề:
          <ul>
          <li>Mệnh đề chính hay gọi là mệnh đề kết quả.</li>
          <li>Mệnh đề chứa “if” là mệnh đề phụ hay mệnh đề điều kiện, nó nêu lên điều kiện để mệnh đề chính thành sự thật.</li>
          </ul>
          - Thông thường mệnh đề chính sẽ đứng trước mệnh đề phụ đứng sau. Tuy nhiên chúng ta có thể đảo mệnh đề phụ lên trước câu và thêm dấu phẩy vào sau mệnh đề phụ để ngăn cách giữa mệnh đề phụ và mệnh đề chính.
          <br>Ví dụ: If the weather is nice, I will go to Cat Ba tomorrow.
          <h1>2. Các loại câu điều kiện</h1>
          <h2>2.1. Câu điều kiện loại 0 (zero conditional)</h2>
          - Công thức: If S + V (HTĐ), S + V (HTĐ).
          <br>
          - Cách dùng:
          <ul>
          <li>sử dụng để diễn giải thích tình huống những tình huống được coi là chân lý, thường là những sự thật trong cuộc sống</li>
          <br> Ví dụ: If you freeze water, it becomes a solid.
          <li>sử dụng để đưa ra những lời chỉ dẫn, lời đề nghị.</li>
          <br> Ví dụ: If Bill phones, tell him to meet me at the cinema.
          </ul> 
          <h2>2.2. Câu điều kiện loại 1</h2>
          - Công thức: If S + V (HTĐ), S + will + V (TLĐ).
          <br>- Cách dùng: diễn tả những sự việc có khả năng xảy ra ở hiện tại hoặc tương lai và kết quả của nó.
          <br>Ví dụ: If I have time, I’ll finish that letter.
          <br>
          <br>Trong câu điều kiện loại 1, thay vì sử dụng thì tương lai chúng ta cũng có thể sử dụng các động từ khuyết thiếu để thể hiện mức độ chắc chắn hoặc đề nghị một kết quả nào đó
          <br><br>Ví dụ: If you drop that glass, it might break.
          <h2>2.3. Câu điều kiện loại 2</h2>
          - Công thức: If + S + V-ed (QKĐ), S + would + V. <br>
          - Cách dùng: diễn tả những tình huống không có thật, không thể xảy ra trong tương lai và giả định kết quả nếu nó có thể xảy ra
          <br>Ví dụ: If the weather wasn’t so bad, we could go to the park.(But the weather is bad so we can’t go.
          <br><br><br>
        </body>
      </html>
      ''',),
  GrammarCategory(
      id: '5',
      title: 'Passive Voice',
      content: '''
      <html>
        <body>
        <h1>1. Khái niệm</h1>
        Câu bị động là câu được dùng khi cần nhấn mạnh đến đối tượng chịu tác động của hành động thay vì bản thân hành động đó.
        Cấu trúc: 
        <ul>
        <li>Câu chủ động: S1 + V + O</li>
        <li>Câu bị động: S2 + tobe + V3/-ed</li>
        </ul>
        <br>Ví dụ: Anne gives Nam a lovely gift.
        <br>=> Nam is given a lovely gift by Anne.
        <span>Lưu ý:</span>
        <ul>
        <li>Nếu chủ ngữ trong câu chủ động là people, they, everyone, someone, anyone… sẽ được lược bỏ khi chuyển thành Passive Voice.
        <br>Ví dụ: Someone stole my bicycle yesterday. 
        <br>=> My bicycle was stolen yesterday.
        </li>
        <li>Khi chuyển từ dạng chủ động sang bị động, người hoặc vật trực tiếp làm ra hành động thì dùng by, gián tiếp làm ra hành động thì dùng with.</li>
        <br>Ví dụ: The bear was shot with the gun. 
 
        </ul>
        <h1>2. Cách chuyển đổi từ chủ động sau dạng bị động</h1>
        <ul>
        <li>Bước 1: Xác định tân ngữ trong câu chủ động để sử dụng làm chủ ngữ trong câu bị động.</li>
        <li>Bước 2: Xác định thì trong câu chủ động để chuyển động từ về dạng bị động.</li>
        <li>Bước 3: Chuyển chủ ngữ trong câu chủ động thành tân ngữ và thêm by hoặc with phía trước. Có thể bỏ qua các tân ngữ không xác định như đề cập ở trên.</li>
        </ul>
        <h1>3. Cấu trúc câu bị động trong các thì tiếng Anh</h1>
        <table>
        <tr>
        <th>Thì</th>
        <th>Chủ động</th>
        <th>Bị động</th>
        </tr>
        <tr>
        <td>Hiện tại đơn</td>
        <td>S + V(s/es) + O</td>
        <td>S + am/is/are + V3/-ed</td>
        </tr>
        <tr>
        <td>Hiện tại tiếp diễn</td>
        <td>S + am/is/are + V-ing + O</td>
        <td>S + am/is/are + being + V3/-ed</td>
        </tr>
        <tr>
        <td>Hiện tại hoàn thành</td>
        <td>S + have/has + V3/-ed + O</td>
        <td>S + have/has + been + V3/-ed</td>
        </tr>
        <tr>
        <td>Quá khứ đơn</td>
        <td>S + V(ed/Ps) + O</td>
        <td>S + was/were + V3/-ed</td>
        </tr>
        <tr>
        <td>Quá khứ tiếp diễn</td>
        <td>S + was/were + V-ing + O</td>
        <td>S + was/were + being + V3/-ed</td>
        </tr>
        <tr>
        <td>Quá khứ hoàn thành</td>
        <td>S + had + V3/-ed + O</td>
        <td>S + had + been + V3/-ed</td>
        </tr>
        <tr>
        <td>Tương lai đơn</td>
        <td>S + will + V-infi + O</td>
        <td>S + will + be + V3/-ed</td>
        </tr>
        <tr>
        <td>Tương lai hoàn thành</td>
        <td>S + will + have + V3/-ed + O</td>
        <td>S + will + have + been + V3/-ed</td>
        </tr>
        <tr>
        <td>Tương lai gần</td>
        <td>S + am/is/are going to + V-infi + O</td>
        <td>S + am/is/are going to + be + V3/-ed</td>
        </tr>
        <tr>
        <td>Động từ khuyết thiếu</td>
        <td>S + ĐTKT + V-infi + O</td>
        <td>S + ĐTKT + be + V3/-ed</td>
        </tr>
        </table>
        <br><br><br>
        </body>
      </html>
      '''),
  GrammarCategory(
      id: '6',
      title: 'Reported Speech',
      content: '''
      <html>
        <body>
          <h1>1. Khái niệm</h1>
          <ul>
          <li>Câu trực tiếp: là một câu nói chính xác lời của một người diễn đạt, do đó nó còn được gọi là câu trích dẫn. 
          <br>
          Cấu trúc câu trực tiếp bao gồm: [Mệnh đề tường thuật] + [“mệnh đề được tường thuật lại”]. 
          <br>
          Mệnh đề được tường thuật lại sẽ đặt trong dấu ngoặc kép nhằm nhắc lại chính xác câu từ của người nói. 
          <br>
          Ví dụ:  He said, “I went to school yesterday.”
          </li>
          <li>Câu gián tiếp: Là một câu nói thuật lại lời của một người khác nói ở dạng gián tiếp, cấu trúc câu gián tiếp không sử dụng dấu ngoặc kép và có sự biến đổi về thì của câu. 
          <br>
          Cấu trúc câu gián tiếp bao gồm: [Mệnh đề tường thuật] + that + [Mệnh đề được tường thuật lại].
          <br>
          Ví dụ: Mary said that she is hungry now.
          </li>
          </ul>
          <h1>2. Cách chuyển câu trực tiếp sang câu gián tiếp</h1>
          <h2>Bước 1: Xác định từ tường thuật</h2>
          <br>Với câu tường thuật, chúng ta có các động từ: told, said, asked, denied, promised,...
          <h2>Bước 2: Lùi thì</h2>
          <table>
          <tr>
          <th>Câu trực tiếp</th>
          <th>Câu gián tiếp</th>
          </tr>
          <tr>
          <td>Hiện tại đơn/ tiếp diễn/  hoàn thành</td>
          <td>Quá khứ đơn/ tiếp diễn/ hoàn thành</td>
          </tr>
          <tr>
          <td>Quá khứ đơn</td>
          <td>Quá khứ hoàn thành</td>
          </tr>
          <tr>
          <td>Quá khứ tiếp diễn</td>
          <td>Quá khứ hoàn thành tiếp diễn</td>
          </tr>
          <tr>
          <td>Quá khứ hoàn thành</td>
          <td>Quá khứ hoàn thành</td>
          </tr>
          <tr>
          <td>Tương lai đơn</td>
          <td>Tương lai trong quá khứ</td>
          </tr>
          <tr>
          <td>Tương lai gần (am/is/are + going to V)</td>
          <td>was/ were going to V</td>
          </tr>
          <tr>
          <td>will</td>
          <td>would</td>
          </tr>
          <tr>
          <td>Shall/ Can / May</td>
          <td>Should / Could/ Might</td>
          </tr>
          <tr>
          <td>Should / Could/ Might/ Would/ Must</td>
          <td>Giữ nguyên</td>
          </tr>
          </table>
          <br><br>
          Ví dụ: Nam told me: “My girlfriend will come here to visit me tomorrow”
          <br>
          ⇒ Nam told me that my girlfriend <span>would</span> come here to visit me tomorrow. 
          <h2>Bước 3: Đổi đại từ nhân xưng, tính từ sở hữu và đại từ sở hữu</h2>
          Ví dụ: Nam told Hoa: “My girlfriend will come here to visit me tomorrow”
          <ul>
          <li>Tình huống 1: Một người bạn của Hoa tường thuật với người bạn khác
          <br>Nam told Hoa that <span>his</span> girlfriend would come here to visit <span>him</span> tomorrow</li>
          <li>Tình huống 2: Hoa tường thuật với một người khác
          <br>Nam told me that <span>his</span> girlfriend would come here to visit <span>him</span> tomorrow</li>
          <li>Tình huống 3: Nam tường thuật lại với người khác
          <br>I told Hoa that <span>my</span> girlfriend would come here to visit <span>me</span> tomorrow</li>
          </ul>
          <h2>Bước 4: Đổi cụm từ chỉ thời gian, nơi chốn</h2>
          <table>
          <tr>
          <th>Câu trực tiếp</th>
          <th>Câu gián tiếp</th>
          </tr>
          <tr>
          <td>Here</td>
          <td>There</td>
          </tr>
          <tr>
          <td>Now</td>
          <td>Then</td>
          </tr>
          <tr>
          <td>Today/ tonight</td>
          <td>That day/ That night</td>
          </tr>
          <tr>
          <td>Yesterday</td>
          <td>The previous day, the day before</td>
          </tr>
          <tr>
          <td>Tomorrow</td>
          <td>The following day, the next day</td>
          </tr>
          <tr>
          <td>Ago</td>
          <td>Before</td>
          </tr>
          <tr>
          <td>Last (week)</td>
          <td>The previous week, the week before</td>
          </tr>
          <tr>
          <td>Next (week)</td>
          <td>The following week, the next week</td>
          </tr>
          <tr>
          <td>This</td>
          <td>That</td>
          </tr>
          <tr>
          <td>These</td>
          <td>Those</td>
          </tr>
          </table>
          <br><br>
          Ví dụ: Nam told me: “My girlfriend will come here to visit me tomorrow”
          <br>
          ⇒ Nam told me that my girlfriend would come <span>there</span> to visit him <span>the next day</span>.
        </body>
      </html>
      ''',
  ),
  GrammarCategory(
      id: '7',
      title: 'Used to',
      content: '''
      <html>
      <body>
      <h1>1. Used to</h1>
      <h2>1.1. Công thức</h2>
      <ul>
      <li>Khẳng định: S + used to + V</li>
      <li>Phủ định: S + did not + use to + V</li>
      <li>Nghi vấn: Did + S + use to + V ?</li>
      </ul>
      <h2>1.2. Cách dùng</h2>
      <ul>
      <li>sử dụng để nói về một thói quen, hành động, sự kiện hoặc trạng thái đã từng xảy ra trong quá khứ và không còn xảy ra trong hiện tại nữa</li>
      <li>Đôi khi nó được dùng để nhấn mạnh về sự khác biệt giữa hiện thực và quá khứ</li>
      </ul>
      <h2>1.3. Ví dụ</h2>
      <ul>
      <li>There used to be a cinema here.</li>
      <li>He didn’t use to go swimming.</li>
      <li>Did he use to smoke?</li>
      </ul>
      <h1>2. Be used to V-ing</h1>
      <h2>2.1. Công thức</h2>
      <ul>
      <li>Khẳng định: S + be + used to + V-ing</li>
      <li>Phủ định: S + be not + used to + V-ing</li>
      <li>Nghi vấn: Be + S + used to + V-ing ?</li>
      </ul>
      <h2>2.2. Cách dùng</h2>
      diễn tả ai đó đã từng làm 1 việc gì đó nhiều lần và đã có kinh nghiệm, không còn lạ lẫm với việc đó nữa.
     
      <h2>2.3. Ví dụ</h2>
      <ul>
      <li>I am used to being lied to.</li>
      <li>He wasn’t used to the heat and he caught sunstroke.</li>
      <li>Is she used to cooking?</li>
      </ul>
      <h1>3. Get used to V-ing</h1>
      <h2>3.1. Công thức</h2>
      <ul>
      <li>Khẳng định: S + get + used to + V-ing</li>
      <li>Phủ định: S + do not + get used to + V-ing</li>
      <li>Nghi vấn: Do + S + get used to + V-ing ?</li>
      </ul>
      <h2>3.2. Cách dùng</h2>
      diễn tả  ai đó đang dần quen 1 vấn đề hoặc sự việc nào đó.  
     
      <h2>3.3. Ví dụ</h2>
      <ul>
      <li>You might find it strange at first but you will soon get used to it.</li>
      <li>We couldn’t get used to the noisy neighborhood, so we moved.</li>
      <li>Have Tom got used to driving on the left yet?</li>
      </ul>
      
      <br><br><br>
      </body>
      </html>
      ''',),

  GrammarCategory(
      id: '8',
      title: 'Modal verbs', content: ''),
  GrammarCategory(
      id: '9',
      title: 'Imperative sentences', content: ''),
  GrammarCategory(
      id: '10',
      title: 'Question Tags', content: ''),
  GrammarCategory(
      id: '11',
      title: 'Gerund', content: ''),
  GrammarCategory(
      id: '12',
      title: 'Much, many, a lot of, too, enough', content: ''),
  GrammarCategory(
      id: '13',
      title: 'Phrasal verbs', content: ''),
  GrammarCategory(
      id: '14',
      title: 'Relative Clause', content: ''),


];

const TENSE_CATEGORIES = const [
  TenseCategory(
      id: '1',
      title: 'Present Simple'),
  TenseCategory(
      id: '2',
      title: 'Present Continuous'),
  TenseCategory(
      id: '3',
      title: 'Present Perfect'),
  TenseCategory(
      id: '4',
      title: 'Past Simple'),
  TenseCategory(
      id: '5',
      title: 'Past Continuous'),
  TenseCategory(
      id: '6',
      title: 'Past Perfect'),
  TenseCategory(
      id: '7',
      title: 'Future Simple'),
];

const TYPES_OF_WORD_CATEGORIES = const [
  TypesOfWordCategory(
      id: '1',
      title: 'Noun',
      content: ''),
  TypesOfWordCategory(
      id: '2',
      title: 'Verb',
      content: ''),
  TypesOfWordCategory(
      id: '3',
      title: 'Adjective',
      content: ''),
  TypesOfWordCategory(
      id: '4',
      title: 'Adverb',
      content: ''),
  TypesOfWordCategory(
      id: '5',
      title: 'Pronoun',
      content: ''),
  TypesOfWordCategory(
      id: '6',
      title: 'Preposition',
      content: ''),
  TypesOfWordCategory(
      id: '7',
      title: 'Conjunction',
      content: ''),
  TypesOfWordCategory(
      id: '8',
      title: 'Article',
      content: ''),
];
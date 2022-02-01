from django.shortcuts import render
from django.shortcuts import redirect

# Create your views here.
from django.forms.models import modelformset_factory
from django.db import transaction
from .models import MyModel,Post,File
from .forms import MyForm,PostCreateForm,FileFormset


def add_post(request):
    form = PostCreateForm(request.POST or None)
    context = {'form': form}
    if request.method == 'POST' and form.is_valid():
        post = form.save(commit=False)
        formset = FileFormset(request.POST, files=request.FILES, instance=post)  # 今回はファイルなのでrequest.FILESが必要
        if formset.is_valid():
            post.save()
            formset.save()
            return redirect('home:home')

        # エラーメッセージつきのformsetをテンプレートへ渡すため、contextに格納
        else:
            context['formset'] = formset

    # GETのとき
    else:
    #     # 空のformsetをテンプレートへ渡す
        context['formset'] = FileFormset()

    return render(request, 'post_form.html', context)
 
def HogeCreateView(request):
 
    template_name = 'hoge_form.html'
 
    # フォームセット定義
    # modelformset_factoryを使う。
    # modelformじゃない時はforms.formset_factory
    MyFormSet= modelformset_factory(
        model=MyModel,
        form=MyForm,
        extra=1, # セットの表示数 defaultは1
        max_num=3 # 最大表示数 defaultは1
    )
 
    if request.method == 'GET' :
        # フォームの初期値を指定する場合
        form_initial = [{
            'product_nm' : 'initial_value_1',
            # 'field_1' : 'initial_value_1',
            # 'field_2' : 'initial_value_2',
        }]
        # フォームセットのオブジェクト生成
        form_set = MyFormSet(
            initial=form_initial,
            # # 新規作成フォームのみ表示(既存レコードは表示しない)
            queryset=MyModel.objects.none()
            # 新規作成フォームのみ表示(既存レコードは表示しない)
            # queryset=MyModel.objects.all()
        )
    else : # POST
        form_set = MyFormSet(request.POST)
        if form_set.is_valid() :
            posts = form_set.save(commit=False)
            # 保存処理
            with transaction.atomic() :
                # 各々save(m2mってのもあるらしいが試してない)
                for p in posts :
                    # 他のフォームを併設している場合、そこでsaveしたレコードのPKを使う場合はobject.pkでとれる
                    #p.parent_pk = other_post.pk
                    p.save()
 
            # messages.info(request, f'保存しました。')
            return redirect('home:home')
 
    # レンダリング
    context = {
        'form_set': form_set,
    }
    return render(request, template_name, context)
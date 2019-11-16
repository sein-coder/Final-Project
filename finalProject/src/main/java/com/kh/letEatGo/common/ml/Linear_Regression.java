package com.kh.letEatGo.common.ml;

import weka.classifiers.functions.LinearRegression;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

public class Linear_Regression {
	
	public static double predict(double temperature,double precipitation,int day) {
		try {
			// Load Data set //훈련용 데이터셋 로딩
			DataSource source = new DataSource("C:\\Users\\sein\\Desktop\\data\\Train.arff");
			Instances dataset = source.getDataSet();
			// set class index to the last attribute //클래스 인덱스 설정 (마지막 속성위치에)
			dataset.setClassIndex(dataset.numAttributes() - 1);
	
			// Build model // 모델 빌드
			LinearRegression model = new LinearRegression();
			model.buildClassifier(dataset);
			// output model // 모델 빌드 결과
	
			// Now Predicting the cost //예측
			//DataSource psource = new DataSource("C:\\Users\\sein\\Desktop\\data\\TrainP.arff");
			//Instances dataset2 = psource.getDataSet();
			//dataset2.setClassIndex(dataset2.numAttributes()-1);
			//Instance myHouse = dataset2.lastInstance();
			Instance dataset2 = new DenseInstance(4);
			dataset2.setValue(dataset.attribute("day"), day);
			dataset2.setValue(dataset.attribute("temperature"), temperature);
			dataset2.setValue(dataset.attribute("precipitation"), precipitation);
	
			double price = model.classifyInstance(dataset2);
			
			return price;
		}
		catch(Exception e) {
			return 0;
		}
	}

}
